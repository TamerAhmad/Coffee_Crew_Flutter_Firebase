import 'package:coffeecrewflutter/screens/authenticate/sign_in.dart';
import 'package:coffeecrewflutter/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/shared/theme.dart';
import 'package:coffeecrewflutter/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';
  String error = '';

  bool showSpinner = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSpinner ? LoadingWidget() : SafeArea(
        child: Container(
          color: offWhite,
          child: Column(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50,),
                        Text(
                          'Sign Up',
                          style: kStyleTitle.copyWith(color: brownDark),
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
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Icon(
                                  Icons.person,
                                  color: brownDark,
                                  size: 30.0,
                                ),
                              ),
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
                                  color: brownDark,
                                  size: 30.0,
                                ),
                              ),
                            ),
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
                                    .registerWithEmailPass(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply informaiton';
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
                                color: brownDark,
                              ),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(error),
                        SizedBox(height: 5.0,),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already have an account! Sign in',
                            style: kHintTextStyle,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
