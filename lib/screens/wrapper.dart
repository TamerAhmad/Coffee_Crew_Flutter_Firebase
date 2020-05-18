import 'package:coffeecrewflutter/screens/authenticate/authenticate.dart';
import 'package:coffeecrewflutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeecrewflutter/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    return user != null ? Home() :Authenticate();
  }
}
