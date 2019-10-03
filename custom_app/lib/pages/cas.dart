import 'package:flutter/material.dart';
import 'package:custom_app/main.dart';

class CreateASmoothie extends StatefulWidget {
  @override
  _CASState createState() => _CASState();
}

class _CASState extends State<CreateASmoothie> {

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
                //Navigator.push(
                 //context,
                 //MaterialPageRoute(builder: (context) => CreateASmoothie()),
                //);    //Already on the page so no need to navigate there
              },
            ),

            //To add more pages, copy and paste the ListTile then update text
            //and MaterialPageRoute to the correct name and page.
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Create a Smoothie'),
      ),
      body: Center(
        child: Text('Create a smoothie here...'),
      )
    );
  }
}