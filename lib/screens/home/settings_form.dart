import 'package:coffeecrewflutter/model/user.dart';
import 'package:coffeecrewflutter/services/database.dart';
import 'package:coffeecrewflutter/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/shared/theme.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final Key _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  double sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Your Brew Info',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: _currentName ?? userData.name,
                    validator: (value) =>
                        value.isEmpty ? 'Please Enter a Name' : null,
                    onChanged: (value) {
                      setState(() {
                        _currentName = value;
                      });
                    },
                    decoration: kTextFieldDecoration2.copyWith(
                      hintText: 'Enter the new name',
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                      value: _currentSugars ?? userData.sugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugar(s)'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        return setState(() {
                          _currentSugars = value;
                        });
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Week'),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.grey[400],
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: Colors
                              .brown[_currentStrength ?? userData.strength],
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayColor: Colors.blue[100],
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0),
                          trackHeight: 4.0,
                        ),
                        child: Slider(
                          value: (_currentStrength ?? userData.strength)
                              .toDouble(),
                          min: 100,
                          max: 900,
                          divisions: 8,
                          onChanged: (value) {
                            setState(
                              () {
                                _currentStrength = value.round();
                              },
                            );
                          },
                        ),
                      ),
                      Text('Strong'),
                    ],
                  ),
                  Text((_currentStrength ?? userData.strength).toString()),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () async {
//                      if(_formKey.){
//
//                      }
                      await DatabaseService(uid: user.uid).updateUserData(
                          _currentName ?? userData.name,
                          _currentSugars ?? userData.sugars,
                          _currentStrength ?? userData.strength);
                      Navigator.pop(context);
                     print(userData.sugars);
                    },
                    color: blue,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return LoadingWidget();
          }
        });
  }
}
