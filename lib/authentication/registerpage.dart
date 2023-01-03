import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/authentication/validator.dart';
import 'package:myapp/style/theme.dart' as Style;

import 'fireauth.dart';
import 'profilepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        // backgroundColor: Style.Colors.mainColor,
        appBar: AppBar(
          title: Text('Admin'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: 700,
            width: 600,
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white70,
                height: 700,
                width: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Admin',
                      style: TextStyle(fontSize: 50),
                    ),
                    Form(
                      key: _registerFormKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameTextController,
                            focusNode: _focusName,
                            validator: (value) => Validator.validateName(
                              name: value,
                            ),
                            decoration: InputDecoration(
                              hintText: "Name",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            validator: (value) => Validator.validateEmail(
                              email: value,
                            ),
                            decoration: InputDecoration(
                              hintText: "Email",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) => Validator.validatePassword(
                              password: value,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.0),
                          _isProcessing
                              ? CircularProgressIndicator()
                              : Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            _isProcessing = true;
                                          });

                                          if (_registerFormKey.currentState
                                              .validate()) {
                                            User user = await FireAuth
                                                .registerUsingEmailPassword(
                                              name: _nameTextController.text,
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null) {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(user: user),
                                                ),
                                                ModalRoute.withName('/'),
                                              );
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Admin Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
