part of 'main.dart';


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

  Nutritional(this._cal, this._fat, this._fib, this._carb, this._prot);
  var _cal  = 0.0;
  var _fat  = 0.0;
  var _fib  = 0.0;
  var _carb  = 0.0;
  var _prot  = 0.0;
}

final _bases       = <String>["Almond Milk", "Soy Milk", "Nonfat Milk", "Coconut Milk", "Coconut Water", "Orange Juice", "Pineapple Juice", "Green Tea"];
final _fruits      = <String>["Spinach", "Kale", "Beets", "Raspberries", "Blueberries", "Bananas", "Mangos", "Strawberries", "Blackberries", "Cucumber", "Avocado", "Cherries", "Carrots"];
//final _supplements = <String>["Whey Protein", "Soy Protein", "Creatine", "Caffeine", "Greek Yogurt"];

List<String> _ing            = ["Almond Milk", "Soy Milk", "Nonfat Milk", "Coconut Milk", "Coconut Water", "Orange Juice", "Pineapple Juice", "Green Tea", "Spinach", "Kale", "Beets", "Raspberries", "Blueberries", "Bananas", "Mangos", "Strawberries", "Blackberries", "Cucumber", "Avocado", "Cherries", "Carrots"];
List<Nutritional> _val        = [Nutritional(20, 1.8, 0.4, 0.7, 0.75), Nutritional(64, 2.36, 1.6, 6.04, 5.48), Nutritional(42, 0.22, 0, 5.94, 4.18), Nutritional(276, 28.6, 2.6, 6.64, 2.74), Nutritional(22, 0.24, 1.4, 4.46, 0.86), Nutritional(56, 0.24, 0.2, 12.9, 0.86), Nutritional(66, 0.16, 0.2, 16.08, 0.44), Nutritional(2, 0, 0, 0.92, 0), Nutritional(3, 0.06, 0.3, 0.54, 0.43), Nutritional(17, 0.23, 0.7, 3.35, 1.11), Nutritional(29, 0.12, 1.9, 6.5, 1.09), Nutritional(32, 0.4, 4, 7.34, 0.74), Nutritional(41, 0.24, 1.7, 10.51, 0.54), Nutritional(67, 0.25, 2, 17.13, 0.82), Nutritional(54, 0.22, 1.5, 14.02, 0.42), Nutritional(27, 0.25, 1.7, 6.37, 0.56), Nutritional(31, 0.35, 3.8, 6.92, 1), Nutritional(8, 0.06, 0.3, 1.89, 0.34), Nutritional(120, 11, 5, 6.4, 1.5), Nutritional(46, 0.14, 1.5, 11.61, 0.77), Nutritional(26, 0.15, 1.8, 6.13, 0.6),];
Map<String, Nutritional> _nut = new Map.fromIterables(_ing, _val);

var _stats                    = [0.0, 0.0, 0.0, 0.0, 0.0];

var _completedShakes = <ShakeStruct>[];
var _completedStats = <Nutritional>[];
var _quantities = <int>[];
var _fquantities = <int>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];   //keep synced with _frts


var _name            = "";
var _addedFruits     = <String>[];
var _addedBases      = <String>[""];


// Email User Name and Password
String storeusername = 'customshake430@gmail.com';
String password = 'csci430!';

String orderNumber;