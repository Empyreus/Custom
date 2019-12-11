// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:custom_app/database_helpers.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

const PrimaryColor = Color.fromRGBO(74, 101, 114, 1.0);

// Email User Name and Password
String storeusername = 'customshake430@gmail.com';
String password = 'csci430!';

String orderNumber;

var message = Message()
  ..from = Address(storeusername, 'CustomShake')
  ..recipients.add(storeusername)
  ..subject = 'Order Number: '
  ..text = 'This is the plain text.';

Future<void> _emailAlert(BuildContext context) {
  TextEditingController _textFieldController = TextEditingController();

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Order Receipt'),
            content: TextField(
                controller: _textFieldController,
                decoration:InputDecoration(hintText: "Enter Email Address")
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Send'),
                onPressed: () {
                  emailTest(_textFieldController.text.toString(), 0);
                  Navigator.of(context).pop();
                },
              )
            ]
        );
      }
  );
}

void emailTest(var email, int internalExternal) async {
  var username = email;
  message.recipients.clear();
  message.recipients.add(username);

  var smtpServer = gmail(storeusername, password);

  //Set Order Number
  message.subject = orderNumber;

  //Set Message
  if(internalExternal == 1) {
    message.text = 'Customer Shake ${DateTime.now()}\n';
  }
  else {
    message.text = "Your order number is " + orderNumber + '\n\n';
  }
  for (int i = 0; i < _completedShakes.length; i++) {
    message.text =
    message.text + _completedShakes[i]._bases[0].toString() + '  ' +
    _completedShakes[i]._fruits.toString() + '\n';
  }

  if(internalExternal != 1) {
    _completedShakes = <ShakeStruct>[];
    _completedStats = <Nutritional>[];
  }

  //Send Email
  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
    Fluttertoast.showToast(
        msg: "Message Sent.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  } on MailerException catch (e) {
    print('Message not sent.');
    Fluttertoast.showToast(
        msg: "Message not sent.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}


class ShakeStruct {
  ShakeStruct(this._name, this._bases, this._fruits, this._fruitQuantities, this._stats);
  var _name          = "";
  var _bases         = <String>[];
  var _fruits        = <String>[];
  var _vegtables     = <String>[];
  var _supplements   = <String>[];
  var _fruitQuantities = <int> [];
  var _stats = <double> [];
}

class Nutritional {

  Nutritional(this._cal, this._fat, this._fib, this._carb, this._prot);
  var _cal  = 0.0;
  var _fat  = 0.0;
  var _fib  = 0.0;
  var _carb  = 0.0;
  var _prot  = 0.0;
}

final _bases       = <String>["Almond Milk", "Soy Milk", "Nonfat Milk", "Coconut Milk", "Coconut Water", "Orange Juice", "Pineapple Juice", "Green Tea"];
final _fruits      = <String>["Spinach", "Kale", "Beets", "Raspberries", "Blueberries", "Bananas", "Mangos", "Strawberries", "Blackberries", "Cucumber", "Avocado", "Cherries", "Carrots"];
final _supplements = <String>["Whey Protein", "Soy Protein", "Creatine", "Caffeine", "Greek Yogurt"];

List<String> _ing            = ["Almond Milk", "Soy Milk", "Nonfat Milk", "Coconut Milk", "Coconut Water", "Orange Juice", "Pineapple Juice", "Green Tea", "Spinach", "Kale", "Beets", "Raspberries", "Blueberries", "Bananas", "Mangos", "Strawberries", "Blackberries", "Cucumber", "Avocado", "Cherries", "Carrots"];
List<Nutritional> _val        = [Nutritional(20, 1.8, 0.4, 0.7, 0.75), Nutritional(64, 2.36, 1.6, 6.04, 5.48), Nutritional(42, 0.22, 0, 5.94, 4.18), Nutritional(276, 28.6, 2.6, 6.64, 2.74), Nutritional(22, 0.24, 1.4, 4.46, 0.86), Nutritional(56, 0.24, 0.2, 12.9, 0.86), Nutritional(66, 0.16, 0.2, 16.08, 0.44), Nutritional(2, 0, 0, 0.92, 0), Nutritional(3, 0.06, 0.3, 0.54, 0.43), Nutritional(17, 0.23, 0.7, 3.35, 1.11), Nutritional(29, 0.12, 1.9, 6.5, 1.09), Nutritional(32, 0.4, 4, 7.34, 0.74), Nutritional(41, 0.24, 1.7, 10.51, 0.54), Nutritional(67, 0.25, 2, 17.13, 0.82), Nutritional(54, 0.22, 1.5, 14.02, 0.42), Nutritional(27, 0.25, 1.7, 6.37, 0.56), Nutritional(31, 0.35, 3.8, 6.92, 1), Nutritional(8, 0.06, 0.3, 1.89, 0.34), Nutritional(120, 11, 5, 6.4, 1.5), Nutritional(46, 0.14, 1.5, 11.61, 0.77), Nutritional(26, 0.15, 1.8, 6.13, 0.6),];
Map<String, Nutritional> _nut = new Map.fromIterables(_ing, _val);
var _stats                    = [0.0, 0.0, 0.0, 0.0, 0.0];

var _completedShakes = <ShakeStruct>[];
var _completedStats = <Nutritional>[];
var _quantities = <int>[];
var _fquantities = <int>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];   //keep synced with _frts
final _biggerFont      = const TextStyle(fontSize: 18.0);

var _name            = "";
var _addedFruits     = <String>[];
var _addedBases      = <String>[""];


void main() => runApp( MaterialApp(
    title: 'Custom Shakes',
    theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
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
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Shake Cart")
        ),
        body: Center(
          child: Cart(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton.extended(
                    backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
                    onPressed:() {
                      orderNumber = "Order Number: " + DateTime.now().millisecondsSinceEpoch.toString().substring(3,12);
                      checkoutCart(context);
                    },
                    icon: Icon(Icons.done_all),
                    label:Text("Checkout"),
                    tooltip: 'Checkout Cart',
                    heroTag: "btn1",
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
                    onPressed: () {
                      _addedBases = <String>[""];
                      _addedFruits = <String>[];
                      Navigator.pushNamed(context, '/second');
                    },
                    icon: Icon(Icons.add),
                    label: Text("New Item"),
                    tooltip: 'Create New Smoothie',
                    heroTag: "btn2",
                  )
                ]
            )
        )
    );
  }
}

checkoutCart(BuildContext context){
  _emailAlert(context);

  emailTest(storeusername, 1);
//  _completedShakes = <ShakeStruct>[];
//  _completedStats = <Nutritional>[];
  Fluttertoast.showToast(
      msg: 'Checkout Complete!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

/*
 * Select Base
 */
class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Carts(),
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
      body: _buildCart(context),
    );
  }

  Widget _buildCart(BuildContext context) {
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
                if (i.isOdd)
                  return Divider();
                final index = i ~/ 2;
                return _buildCartRow(_completedShakes[index], _completedStats[index]._cal, _completedStats[index]._fat, _completedStats[index]._fib, index);
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


  Widget _buildCartRow(ShakeStruct shake, double cal, double fat, double fib, int index){//String base, int cal) {
    return GestureDetector(
      onTap:(){
        print("Card " + (index+1).toString() + " tapped!");
        _name = shake._name;
        _addedBases = shake._bases;
        _addedFruits = shake._fruits;
        _stats = shake._stats;
        _fquantities = shake._fruitQuantities;
        //_completedShakes.remove(index);
        //_completedStats.remove(index);
        //_quantities.remove(index);
        Navigator.pushNamed(
            context,
            '/fourth'
        );
      },
      child: Card(
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
                                "Fiber"
                            ),
                            Text(
                                fib.toString()
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
        backgroundColor: PrimaryColor,
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

int sumQuantity(){
  var total = 0;
  var size = _fquantities.length;
  for(int i = 0; i < size; i++){
    total = total + _fquantities[i];
  }
  return total;
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
          if(sumQuantity() == 3) {
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
        backgroundColor: PrimaryColor,
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
                              "Fiber"
                          ),
                          Text(
                              _nut[fruit]._fib.toString()
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
                    if(!_addedFruits.contains(fruit))
                      _addedFruits.add(fruit);
                    _incrementQuantity(index);
                    _stats[0] += _nut[fruit]._cal;
                    _stats[1] += _nut[fruit]._fat;
                    _stats[2] += _nut[fruit]._fib;
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
                      _stats[2] -= _nut[fruit]._fib;
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

  int newName(String name)
  {
    int size = _completedShakes.length;
    if (size == -1)
      return -1;
    for(int i = 0; i < size; i++)
    {
      if(_completedShakes[i]._name.toLowerCase() == name.toLowerCase())
      {
        return i;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Checkouts()
      ),
      floatingActionButton: FloatingActionButton (
        backgroundColor: Color.fromRGBO(249, 170, 51, 1.0),
        onPressed: () {
          var size = _addedFruits.length;
          for(int i = size; i < 3; i++)
          {
            _addedFruits.add("");
          }
          _save(_name, _addedBases[0], _addedFruits[0], _addedFruits[1], _addedFruits[2], "Protein");
          var _myShake = new ShakeStruct(_name, _addedBases, _addedFruits, _fquantities, _stats);
          var _myStats = new Nutritional(_stats[0], _stats[1], _stats[2], _stats[3], _stats[4]);
          int alreadyMade = newName(_name);
          if(alreadyMade == -1) {
            _completedShakes.add(_myShake);
            _completedStats.add(_myStats);
            _quantities.add(1);
          }
          else
          {
            //_completedShakes[alreadyMade] = _myShake;
            //_completedStats[alreadyMade] = _myStats;
          }
          _fquantities = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
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
        child: Icon(Icons.add_shopping_cart),
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
          backgroundColor: PrimaryColor,
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


  Widget _buildCheckout(){
    var _selected = _addedBases;
    for(int j = 0; j < _addedFruits.length; j++) {
      if (_selected.contains(_addedFruits[j])) {
      }
      else if (_addedFruits[j] != ''){
        _selected.add(_addedFruits[j]);
      }
    }
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

  String getQuantity(String fruit) {
    int findex = _fruits.indexOf(fruit);
    if(findex == -1)
    {
      return 'Base';
    }
    else {
      return _fquantities[findex].toString();
    }
  }

  Nutritional getNutrition(String fruit) {
    if(!_ing.contains(fruit))
    {
      return Nutritional(0,0,0,0,0);
    }
    else {
      return _nut[fruit];
    }
  }

  Widget _buildCheckoutRow(String fruit, int index) {
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
                            getNutrition(fruit)._cal.toString() //_nut[fruit]._cal.toString()
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
                            getNutrition(fruit)._fat.toString()  //_nut[fruit]._fat.toString()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Fiber"
                          ),
                          Text(
                            getNutrition(fruit)._fib.toString() //_nut[fruit]._chol.toString()
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
            child:Column(
              children: <Widget>[
                Text(
                  getQuantity(fruit)
                ),
               ButtonTheme(
                  minWidth: 10.0,
                  buttonColor: Color.fromRGBO(249, 170, 51, 1.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    child: Text(
                      'Edit'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
  return size;
}