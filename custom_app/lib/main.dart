// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final _addedFruits = <String>[];
final _addedBases = <String>[];

void main() => runApp(MaterialApp(
  title: 'Named Routes Demo',
  initialRoute: '/',
  routes: {
    '/': (context) => MyApp(),
    '/second': (context) => SelectBase(),
    '/third': (context) => SelectFruit(),
  }
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Shakes',
      theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("Custom Shakes")
        ),
        body: Center(
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          tooltip: 'Create New Smoothie',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

/*
 * Select Base
 */
class SelectBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Shakes',
      theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
      home: Scaffold(
        body: Center(
          child: Bases()
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
          tooltip: 'Select Bases',
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}

class BasesState extends State<Bases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protein Shake Bases'),
      ),
      body: _buildBases(),
    );
  }
  final _bases = <String>["Whole Milk", "Soy Milk", "Almond Milk", ];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildBases(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _bases.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider();
          final index = i ~/ 2;
          return _buildBaseRow(_bases[index]);
        }
    );
  }

  Widget _buildBaseRow(String base) {
    final bool alreadyAdded = _addedBases.contains(base);
    return ListTile(
      title: Text(
        base,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadyAdded ? Icons.add_circle : Icons.add_circle_outline,
        color: alreadyAdded ? Color.fromRGBO(249, 170, 51, 1.0) : null,
      ),
      onTap: () {
        setState(() {
          if (alreadyAdded) {
            _addedBases.remove(base);
          }
          else {
            _addedBases.add(base);
          }
        });
      }
    );
  }
}

class Bases extends StatefulWidget {
  @override
  BasesState createState() => BasesState();
}

/*
 * Select Fruit
 */
class SelectFruit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Shakes',
      theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
      home: Scaffold(
        body: Center(
            child: Fruits()
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          tooltip: 'Select Bases',
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}

class FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protein Shake Bases'),
      ),
      body: _buildFruits(),
    );
  }
  final _fruits = <String>["Mangos", "Strawberries", "Bananas", ];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildFruits(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _fruits.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider();
          final index = i ~/ 2;
          return _buildFruitRow(_fruits[index]);
        }
    );
  }

  Widget _buildFruitRow(String fruit) {
    final bool alreadyAdded = _addedFruits.contains(fruit);
    return ListTile(
        title: Text(
          fruit,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadyAdded ? Icons.add_circle : Icons.add_circle_outline,
          color: alreadyAdded ? Color.fromRGBO(249, 170, 51, 1.0) : null,
        ),
        onTap: () {
          setState(() {
            if (alreadyAdded) {
              _addedFruits.remove(fruit);
            }
            else {
              _addedFruits.add(fruit);
            }
          });
        }
    );
  }
}

class Fruits extends StatefulWidget {
  @override
  FruitsState createState() => FruitsState();
}
