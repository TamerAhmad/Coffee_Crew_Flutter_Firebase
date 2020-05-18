import 'package:coffeecrewflutter/model/user.dart';
import 'package:coffeecrewflutter/screens/authenticate/sign_in.dart';
import 'package:coffeecrewflutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
