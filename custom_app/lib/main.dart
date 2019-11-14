// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:custom_app/database_helpers.dart';

class ShakeStruct {
  ShakeStruct(this._name, this._bases, this._fruits, this._fruitQuantities);
  var _name          = "";
  var _bases         = <String>[];
  var _fruits        = <String>[];
  var _vegtables     = <String>[];
  var _supplements   = <String>[];
  var _fruitQuantities = <int> [];
}

class Nutritional {

  Nutritional(this._cal, this._fat, this._chol, this._carb, this._prot);
  var _cal  = 0;
  var _fat  = 0;
  var _chol  = 0;
  var _carb  = 0;
  var _prot  = 0;
}

final _bases       = <String>["Whole Milk", "Heavy Cream", "2% Milk", "Fat-Free Milk", "Soy Milk", "Almond Milk", "Coconut Milk", "Lactose Milk"];
final _fruits      = <String>["Mangos", "Strawberries", "Bananas", "Blueberries", "Spinach", "Carrots",  ];
final _supplements = <String>["Whey Protein", "Soy Protein", "Creatine", "Caffeine", "Greek Yogurt"];

List<String> _ing            = ["Mangos", "Strawberries", "Bananas", "Blueberries", "Spinach", "Carrots"];
List<Nutritional> _val        = [Nutritional(1, 1, 1, 1, 1), Nutritional(2, 2, 2, 2, 2), Nutritional(3, 3, 3, 3, 3), Nutritional(4, 4, 4, 4, 4), Nutritional(5, 5, 5, 5, 5), Nutritional(6, 6, 6, 6, 6),];
Map<String, Nutritional> _nut = new Map.fromIterables(_ing, _val);
var _stats                    = [0, 0, 0, 0, 0];

final _completedShakes = <ShakeStruct>[];
final _completedStats = <Nutritional>[];
var _quantities = <int>[];
var _fquantities = <int>[0, 0, 0, 0, 0, 0];   //keep synced with _frts
final _biggerFont      = const TextStyle(fontSize: 18.0);

var _name            = "";
var _addedFruits     = <String>[];
var _addedBases      = <String>[""];


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
            _addedBases = <String>[""];
            _addedFruits = <String>[];
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
            child: Carts(),
        ),
      ),
    );
  }
}

class CartState extends State<Carts> {

  String shakeDetails(ShakeStruct s)
  {
    String details = "";
    details += s._bases[0];
    int numFruits = s._fruits.length;
    for(int i = 0; i < numFruits; i++)
    {
      details += ", " + s._fruits[i];
    }
    return details;
  }

  String shakeName(ShakeStruct s) {
    if(s._name == "") {
      return s._fruits[0];
    }
    else {
      return s._name;
    }
  }

  void _incrementQuantity(int index) {
    setState(() {
      _quantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if(_quantities[index] > 0)
        _quantities[index]--;
      else
        _quantities[index] = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCart(),
    );
  }

  Widget _buildCart() {
    int _size = 0;
    _databaseSize().then((val) => setState((){
      _size = val;
    }));

    return FutureBuilder(
      builder: (context, projectSnap) {
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _completedShakes.length * 2,
            itemBuilder: (context, i) {
              debugPrint("Value");
              if (i.isOdd)
                return Divider();
              final index = i ~/ 2;
              return _buildCartRow(_completedShakes[index], _completedStats[index]._cal, _completedStats[index]._fat, _completedStats[index]._chol, index);
            }
        );
      }
    );
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemCount: _size,
//        itemBuilder: (context, i) {
//          if (i.isOdd)
//            return Divider();
//          final index = i ~/ 2;
//          if (_completedShakes[index]._name == "")
//            return _buildCartRow(_completedShakes[index]._fruits[0], _completedStats[index]._cal);
//          return _buildCartRow(_read(index), _completedStats[index]._cal);
//        }
//    );
  }

  bool alreadyAdded = true;
  Widget _buildCartRow(ShakeStruct shake, int cal, int fat, int chol, int index){//String base, int cal) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      shakeName(shake),
                      style: _biggerFont,
                    ),
                  ],
                ),//Shake Name
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "Calories"
                          ),
                          Text(
                              cal.toString()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Fat"
                          ),
                          Text(
                              fat.toString()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              "Cholesterol"
                          ),
                          Text(
                              chol.toString()
                          ),
                        ],
                      ),
                    ),
                  ],
                ),//
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Color.fromRGBO(249, 170, 51, 1.0),
                child: RaisedButton(
                  onPressed: () => _incrementQuantity(index),
                  child: Text(
                      '+'
                  ),
                ),
              ),
              Text(
                "  " + _quantities[index].toString() + "  ",
              ),
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Color.fromRGBO(249, 170, 51, 1.0),
                child: RaisedButton(
                  onPressed: () => _decrementQuantity(index),
                  child: Text(
                      '-'
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            if(_addedBases[0] != ""){
              Navigator.pushNamed(context, '/third');
            }
            else{
              Fluttertoast.showToast(
                  msg: "Must Select 1 Item",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.blueGrey,
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
        alreadyAdded ? Icons.check_circle : Icons.add_circle_outline,
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
            if(_addedFruits.length == 3) {
              Navigator.pushNamed(context, '/fourth');
            }
            else{
              Fluttertoast.showToast(
                  msg: "Must Select 3 Items",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.blueGrey,
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

class FruitsState extends State<Fruits> {
  void _incrementQuantity(int index) {
    setState(() {
      _fquantities[index]++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if(_fquantities[index] > 0)
        _fquantities[index]--;
      else
        _fquantities[index] = 0;
    });
  }

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
        itemCount: _fruits.length,//*2,
        itemBuilder: (context, i) {
          //if (i.isOdd)
            //return Divider();
          //final index = i ~/ 2;
          return _buildFruitRow(_fruits[i], i);
        }
    );
  }

  Widget _buildFruitRow(String fruit, int index) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      fruit,
                      style: _biggerFont,
                    ),
                  ],
                ),//Shake Name
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "Calories"
                          ),
                          Text(
                              _nut[fruit]._cal.toString()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Fat"
                          ),
                          Text(
                              _nut[fruit]._fat.toString()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              "Cholesterol"
                          ),
                          Text(
                              _nut[fruit]._chol.toString()
                          ),
                        ],
                      ),
                    ),
                  ],
                ),//
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Color.fromRGBO(249, 170, 51, 1.0),
                child: RaisedButton(
                  onPressed: () {
                    if(_fquantities[index] == 0)
                      _addedFruits.add(fruit);
                    _incrementQuantity(index);
                    _stats[0] += _nut[fruit]._cal;
                    _stats[1] += _nut[fruit]._fat;
                    _stats[2] += _nut[fruit]._chol;
                    _stats[3] += _nut[fruit]._carb;
                    _stats[4] += _nut[fruit]._prot;
                  },
                  child: Text(
                      '+'
                  ),
                ),
              ),
              Text(
                "  " + _fquantities[index].toString() + "  ",
              ),
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Color.fromRGBO(249, 170, 51, 1.0),
                child: RaisedButton(
                  onPressed: () {
                    if(_fquantities[index] > 0) {
                      _stats[0] -= _nut[fruit]._cal;
                      _stats[1] -= _nut[fruit]._fat;
                      _stats[2] -= _nut[fruit]._chol;
                      _stats[3] -= _nut[fruit]._carb;
                      _stats[4] -= _nut[fruit]._prot;
                    }
                    _decrementQuantity(index);
                    if(_fquantities[index] == 0)
                      _addedFruits.remove(fruit);
                  },
                  child: Text(
                      '-'
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            _save(_name, _addedBases[0], _addedFruits[0], _addedFruits[1], _addedFruits[2], "Protein");
            var _myShake = new ShakeStruct(_name, _addedBases, _addedFruits, _fquantities);
            var _myStats = new Nutritional(_stats[0], _stats[1], _stats[2], _stats[3], _stats[4]);
            _completedShakes.add(_myShake);
            _completedStats.add(_myStats);
            _quantities.add(1);
            _fquantities = [0, 0, 0, 0, 0, 0];
            _stats[0] = 0;
            _stats[1] = 0;
            _stats[2] = 0;
            _stats[3] = 0;
            _stats[4] = 0;
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
          return _buildCheckoutRow(_selected[index], index);
        }
    );
  }

  String checkoutText(String fruit, int index)
  {
    int findex = _ing.indexOf(fruit);
    if(findex == -1) {
      return fruit;
    }
    else {
      return fruit + " x" + _fquantities[findex].toString();
    }
  }

  Widget _buildCheckoutRow(String fruit, int index) {
    return ListTile(
        title: Text(
          checkoutText(fruit, index),
          style: _biggerFont,
        ),
    );
  }
}

class Checkouts extends StatefulWidget {
  @override
  CheckoutState createState() => CheckoutState();
}

_read(int rowID) async {
  DatabaseHelper helper = DatabaseHelper.instance;
  int rowId = rowID;
  Word word = await helper.queryWord(rowId);
  if (word == null) {
    debugPrint('read row $rowId: empty');
  } else {
    Fluttertoast.showToast(
        msg: 'read row $rowId: ${word.name} ${word.one}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return '${word.name}';
  }
}

_save(String name, String base, String one, String two, String three, String protein) async {
  Word word = Word();
  word.name = name;
  word.base = base;
  word.one = one;
  word.two = two;
  word.three = three;
  word.protein = protein;

  DatabaseHelper helper = DatabaseHelper.instance;
  int id = await helper.insert(word);
  Fluttertoast.showToast(
      msg: 'inserted row: $id',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

_databaseSize() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  int size = await helper.getCount();
  debugPrint('Databas Size: $size');
  return size;
}
