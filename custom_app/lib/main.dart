// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShakeStruct {

  ShakeStruct(this._name, this._bases, this._fruits );
  var _name          = "";
  var _bases         = <String>[];
  var _fruits        = <String>[];
  var _vegtables     = <String>[];
  var _supplements   = <String>[];
}

final _bases       = <String>["Whole Milk", "Heavy Cream", "2% Milk", "Fat-Free Milk", "Soy Milk", "Almond Milk", "Coconut Milk", "Lactose Milk"];
final _fruits      = <String>["Mangos", "Strawberries", "Bananas", "Blueberries", "Spinach", "Carrots",  ];
final _supplements = <String>["Whey Protein", "Soy Protein", "Creatine", "Caffeine", "Greek Yogurt"];

final _completedShakes = <ShakeStruct>[];
final _biggerFont      = const TextStyle(fontSize: 18.0);

var _name            = "";
final _initialBase = "";
var _addedFruits     = <String>[];
var _addedBases      = <String>[_initialBase];


void main() => runApp(MaterialApp(
  title: 'Named Routes Demo',
  initialRoute: '/',
  routes: {
    '/': (context) => MyApp(),
    '/second': (context) => SelectBase(),
    '/third': (context) => SelectFruit(),
    '/fourth': (context) => Checkout()
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
          child: Cart(),
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
class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Shakes',
      theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
      home: Scaffold(
        body: Center(
            child: Carts()
        ),
      ),
    );
  }
}

class CartState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCart(),
    );
  }

  Widget _buildCart(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _completedShakes.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider();
          final index = i ~/ 2;
          if (_completedShakes[index]._name == "")
            return _buildCartRow(_completedShakes[index]._fruits[0]);
          return _buildCartRow(_completedShakes[index]._name);
        }
    );
  }

  Widget _buildCartRow(String base) {
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
              _addedBases[0] = "";
            }
            else {
              _addedBases[0] = base;
            }
          });
        }
    );
  }
}

class Carts extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

/*
 * Select Base
 */
class SelectBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Bases()
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            if(_bases[0] != _initialBase){
              Navigator.pushNamed(context, '/third');
            }
            else{
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
          tooltip: 'Select Bases',
          child: Icon(Icons.check),
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
            _addedBases[0] = "";
          }
          else {
            _addedBases[0] = base;
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
      return Scaffold(
        body: Center(
            child: Fruits()
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, '/fourth');
          },
          tooltip: 'Select Bases',
          child: Icon(Icons.check),
        ),
      );
  }
}

class FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protein Shake Fruits'),
      ),
      body: _buildFruits(),
    );
  }

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
          alreadyAdded ? Icons.check_box : Icons.check_box_outline_blank,
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

/*
 * Checkout
 */
class Checkout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Checkouts()
        ),
        floatingActionButton: FloatingActionButton (
          backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
          onPressed: () {
            var _myShake = new ShakeStruct(_name, _addedBases, _addedFruits);
            _completedShakes.add(_myShake);
            _name = "";
            _addedFruits = <String>[];
            _addedBases = <String>[""];
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          tooltip: 'Checkout',
          child: Icon(Icons.done_all),
        ),
      );
  }
}

class CheckoutState extends State<Checkouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
//      body: _buildCheckout(),
        body: Column(
          children: <Widget>[
            new TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Shake Name',
              ),
              onChanged: (text) {
                _name = text;
              },
            ),
            new Expanded(child: _buildCheckout())
          ],
        )
    );
  }
  final _selected = _addedBases + _addedFruits;

  Widget _buildCheckout(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _selected.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider();
          final index = i ~/ 2;
          return _buildCheckoutRow(_selected[index]);
        }
    );
  }

  Widget _buildCheckoutRow(String fruit) {
    return ListTile(
        title: Text(
          fruit,
          style: _biggerFont,
        ),
    );
  }
}

class Checkouts extends StatefulWidget {
  @override
  CheckoutState createState() => CheckoutState();
}