import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeecrewflutter/model/brew.dart';
import 'package:coffeecrewflutter/screens/home/brew_tile.dart';
import 'package:coffeecrewflutter/shared/loading.dart';

class ListBrews extends StatefulWidget {
  @override
  _ListBrewsState createState() => _ListBrewsState();
}

class _ListBrewsState extends State<ListBrews> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews[index]);
        });
  }
}
