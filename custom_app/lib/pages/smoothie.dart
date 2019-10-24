part of '../main.dart';

class ShakeStruct {

  ShakeStruct(this._name, this._bases, this._fruits );
  var _name          = "";
  var _bases         = <String>[];
  var _fruits        = <String>[];
  var _vegtables     = <String>[];
  var _supplements   = <String>[];
}
class Nutritional {

  Nutritional(this._cal);

  var _cal  = 0;
}

final _bases       = <String>["Whole Milk", "Heavy Cream", "2% Milk", "Fat-Free Milk", "Soy Milk", "Almond Milk", "Coconut Milk", "Lactose Milk"];
final _fruits      = <String>["Mangos", "Strawberries", "Bananas", "Blueberries", "Spinach", "Carrots",  ];
final _supplements = <String>["Whey Protein", "Soy Protein", "Creatine", "Caffeine", "Greek Yogurt"];

List<String> _frts            = ["Mangos", "Strawberries", "Bananas", "Blueberries", "Spinach", "Carrots"];
List<Nutritional> _val        = [Nutritional(1), Nutritional(2), Nutritional(3), Nutritional(4), Nutritional(5), Nutritional(6),];
Map<String, Nutritional> _nut = new Map.fromIterables(_frts, _val);
var _stats                    = [0];

final _completedShakes = <ShakeStruct>[];
final _completedStats = <Nutritional>[];
final _biggerFont      = const TextStyle(fontSize: 18.0);

var _name            = "";
final _initialBase = "";
var _addedFruits     = <String>[];
var _addedBases      = <String>[_initialBase];