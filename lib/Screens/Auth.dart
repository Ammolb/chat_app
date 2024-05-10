


import 'package:flutter/material.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail ='';
  var _enteredPassword ='';

  void _submit() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                              ),
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'pleae enter @ in field';
                                }
                                return null;
                              },
                            onSaved: (value) {
                                _enteredEmail =value!;

                            },
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must have 6 digits';
                                }
                                return null;
                              },
                          onSaved: (value) {
                                _enteredPassword= value!;
                          },),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: _submit,

                            child: Text(_isLogin ? ' Login' : 'Signup'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = _isLogin ? false : true;
                                //  _isLogin = !_isLogin;   you can write this as well(it is inshort)
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create an Account'
                                : 'I already have an Account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
