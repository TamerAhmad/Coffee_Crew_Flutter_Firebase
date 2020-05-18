import 'package:coffeecrewflutter/model/brew.dart';
import 'package:coffeecrewflutter/screens/home/settings_form.dart';
import 'package:coffeecrewflutter/services/auth.dart';
import 'package:coffeecrewflutter/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/shared/theme.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Container(
                child: SettingsForm(),
              ),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coffee Time',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.brown[300],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                return _showSettingPanel();
              },
              label: Text('Setting'),
              icon: Icon(Icons.settings),
            ),
            FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              label: Text('SignOut'),
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/backgr.png'),fit: BoxFit.cover)
          ),
          child: ListBrews(),
        ),
      ),
    );
  }
}
