import 'package:coffeecrewflutter/screens/authenticate/authenticate.dart';
import 'package:coffeecrewflutter/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/shared/theme.dart';
import 'package:coffeecrewflutter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeecrewflutter/model/user.dart';
import 'package:coffeecrewflutter/screens/authenticate/register.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';

  bool showSpinner = false;

  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return showSpinner ? LoadingWidget() : Scaffold(
      body: SafeArea(
        child: Container(
          color: offWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      width: MediaQuery.of(context).size.width,
                      image: AssetImage('images/cloud01.png'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      width: 100,
                      image: AssetImage('images/coffeebean.png'),
                      // fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text(
                      'Welcome Back',
                      style: kStyleTitle,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter an email' : null,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (value) => value.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.lock,
                                color: brownLight,
                                size: 30.0,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              showSpinner=true;
                            });
                            dynamic result = await _authService
                                .signInWithEmailPass(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Email or password is incorrect';
                                showSpinner=false;
                              });
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: brownLight,
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(error,style: TextStyle(color: Colors.red),),
                    SizedBox(
                      height: 5.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: Text(
                        'Dont have an account! Register here',
                        style: kHintTextStyle,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
