//import 'package:flutter/material.dart';
//import 'package:custom_app/main.dart';
//import './cas.dart';
//
//
////This page provides a general template for each page.
////Anything that can be found on all pages should be added here.
////When making a new page, copy and paste the imports
////and either the stateless or stateful template (depending on what the page does)
////Any area that needs to be changed for each page is marked with --change--
////(use ctrl-f to easily find what to update so you don't miss anything)
////***Be sure to update template as well if you are making a blanket change
////to the layout of our app***
//
//
////--------------------------Stateless Widget Template---------------------------
////Use this if the page will stay the same throughout
////Buttons are fine in a stateless widget, but forms are not I believe
//
//class BaseList extends StatelessWidget {     //--change--
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new ListDisplay(),
//    )
//  }
//}
////---------------------End Stateless Widget Template----------------------------
//
//
//
//
//
//
////-----------------------Stateful Widget Template-------------------------------
////Use this if the page will change at all
////Basically if at any point you call the function setState(), use a stateful widget
//
//class ListDisplay extends StatefulWidget {       //--change--
//  @override
//  Widget build(BuildContext context) {
//      return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Testing"),
//        ),
//          body: new ListView.builder
//            (
//              itemCount: testItems.length,
//              itemBuilder: (BuildContext context, int index) {
//                return new Text(testItems[index]);
//              }
//            ) //
//      );
//  }
//}
////----------------------End Stateless Widget Template---------------------------
//
//List<String> testItems = ["1", "4", "Third"];

//Saved from main
//// Copyright 2018 The Flutter team. All rights reserved.
//// Use of this source code is governed by a BSD-style license that can be
//// found in the LICENSE file.
//
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Custom Shakes',
//      theme: new ThemeData(primaryColor: Color.fromRGBO(74, 101, 114, 1.0)),
//      home: Scaffold(
//        body: Center(
//          child: RandomWords(),
//        ),
//      ),
//    );
//  }
//}
//
//class RandomWordsState extends State<RandomWords> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Protein Shake Bases'),
//      ),
//      body: _buildBases(),
//    );
//  }
//  final _bases = <String>["Whole Milk", "Soy Milk", "Almond Milk", ];
//  final _addedBases = <String>[];
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//
//  Widget _buildBases(){
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemCount: _bases.length*2,
//        itemBuilder: (context, i) {
//          if (i.isOdd)
//            return Divider();
//          final index = i ~/ 2;
//          return _buildRow(_bases[index]);
//        }
//    );
//  }
//
//  Widget _buildRow(String base) {
//    final bool alreadyAdded = _addedBases.contains(base);
//    return ListTile(
//      title: Text(
//        base,
//        style: _biggerFont,
//      ),
//      trailing: Icon(
//        alreadyAdded ? Icons.add_circle : Icons.add_circle_outline,
//        color: alreadyAdded ? Color.fromRGBO(249, 170, 51, 1.0) : null,
//      ),
//      onTap: () {
//        setState(() {
//          if (alreadyAdded) {
//            _addedBases.remove(base);
//          }
//          else {
//            _addedBases.add(base);
//          }
//        });
//      }
//    );
//  }
//}
//
//class RandomWords extends StatefulWidget {
//  @override
//  RandomWordsState createState() => RandomWordsState();
//}