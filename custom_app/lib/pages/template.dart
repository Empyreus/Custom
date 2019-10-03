import 'package:flutter/material.dart';
import 'package:custom_app/main.dart';
import './cas.dart';


//This page provides a general template for each page.
//Anything that can be found on all pages should be added here.
//When making a new page, copy and paste the imports
//and either the stateless or stateful template (depending on what the page does)
//Any area that needs to be changed for each page is marked with --change--
//(use ctrl-f to easily find what to update so you don't miss anything)
//***Be sure to update template as well if you are making a blanket change
//to the layout of our app***


//--------------------------Stateless Widget Template---------------------------
//Use this if the page will stay the same throughout
//Buttons are fine in a stateless widget, but forms are not I believe

class INSERTCLASSNAMEHERE extends StatelessWidget {     //--change--
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(    //put DrawerHeader in a container so it doesn't take up 20% of the drawer
              height: 80.0,
              child: DrawerHeader(
                child: Text('Custom!'),
                decoration:BoxDecoration(
                  color: Color(0xFF344955),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pop(context); //closes NavDrawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: Text('Smoothie'),
              onTap: (){
                Navigator.pop(context); //closes NavDrawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateASmoothie()),
                );
              },
            ),
            //To add more pages, copy and paste the ListTile then update text
            //and MaterialPageRoute to the correct name and class.
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PAGE TITLE HERE'),     //--change--
      ),
      body: Center(

        //Put code here

      )
    );
  }
}
//---------------------End Stateless Widget Template----------------------------






//-----------------------Stateful Widget Template-------------------------------
//Use this if the page will change at all
//Basically if at any point you call the function setState(), use a stateful widget

class INSERTSTATEFULNAMEHERE extends StatefulWidget {       //--change--
  @override
  _NAMEState createState() => _NAMEState();                 //--change--x2
}

class _NAMEState extends State<INSERTSTATEFULNAMEHERE> {    //--change--x2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(    //put DrawerHeader in a container so it doesn't take up 20% of the screen
              height: 80.0,
              child: DrawerHeader(
                child: Text('Custom!'),
                decoration:BoxDecoration(
                  color: Color(0xFF344955),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pop(context); //closes NavDrawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: Text('Smoothie'),
              onTap: (){
                Navigator.pop(context); //closes NavDrawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateASmoothie()),
                );
              },
            ),
            //To add more pages, copy and paste the ListTile then update text
            //and MaterialPageRoute to the correct name and class.
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PAGE TITLE HERE'),              //--change--
      ),
      body: Center(

        //Put code here

      )
    );
  }
}
//----------------------End Stateless Widget Template---------------------------