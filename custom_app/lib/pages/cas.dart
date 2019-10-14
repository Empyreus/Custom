//import 'package:flutter/material.dart';
//import 'package:custom_app/main.dart';
//
//class CreateASmoothie extends StatefulWidget {
//  @override
//  _CASState createState() => _CASState();
//}
//
//class _CASState extends State<CreateASmoothie> {
//  List<bool> isSelected;
//
//  @override
//  void initState() {
//    isSelected = [true, false, false];
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: Drawer(
//        child: ListView(
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            Container(    //put DrawerHeader in a container so it doesn't take up 20% of the screen
//              height: 80.0,
//              child: DrawerHeader(
//                child: Text('Custom!'),
//                decoration:BoxDecoration(
//                  color: Color(0xFF344955),
//                ),
//              ),
//            ),
//            ListTile(
//              title: Text('Home'),
//              onTap: (){
//                Navigator.pop(context); //closes NavDrawer
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Home()),
//                );
//              },
//            ),
//            ListTile(
//              title: Text('Smoothie'),
//              onTap: (){
//                Navigator.pop(context); //closes NavDrawer
//                //Navigator.push(
//                 //context,
//                 //MaterialPageRoute(builder: (context) => CreateASmoothie()),
//                //);    //Already on the page so no need to navigate there
//              },
//            ),
//
//            //To add more pages, copy and paste the ListTile then update text
//            //and MaterialPageRoute to the correct name and page.
//          ],
//        ),
//      ),
//      appBar: AppBar(
//        title: Text('Create a Smoothie'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            ToggleButtons(
//              borderColor: Colors.black,
//              fillColor: Color(0xFFF9AA33),
//              borderWidth: 3,
//              selectedBorderColor: Colors.black,
//              selectedColor: Colors.black,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    'Milk',
//                    style: TextStyle(fontSize: 20),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    'Almond Milk',
//                    style: TextStyle(fontSize: 20),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    'Soy Milk',
//                    style: TextStyle(fontSize: 20),
//                  ),
//                ),
//              ],
//              onPressed: (int index) {
//                setState(() {
//                  for (int i = 0; i < isSelected.length; i++) {
//                    if (i == index) {
//                      isSelected[i] = true;
//                    } else {
//                      isSelected[i] = false;
//                    }
//                  }
//                });
//              },
//              isSelected: isSelected,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}