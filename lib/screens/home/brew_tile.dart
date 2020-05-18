import 'package:flutter/material.dart';
import 'package:coffeecrewflutter/model/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(image: AssetImage('images/coffee.png'),),
              CircleAvatar(
                radius: 11.0,
                backgroundColor: Colors.brown[brew.strength],
              ),
            ],
          ),
          title: Text(
            brew.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Takes ${brew.sugars} suger(s)',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
