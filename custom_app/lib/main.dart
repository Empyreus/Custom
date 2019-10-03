import 'package:flutter/material.dart';
import './pages/cas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Shakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        //buttonColor: Colors.black12,
        //backgroundColor: Colors.orange,
        //primaryColor: Colors.black26,    broken?
        //secondaryHeaderColor: Colors.orangeAccent,
      ),
      home: Home(),
    );

  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => MyHomePage()),
                //);    //Already on the page so no need to navigate there
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
            //and MaterialPageRoute to the correct name and page.
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateASmoothie()),
                );
              },
              color: Color(0xFFF9AA33),
              child: const Text(
                  'Smoothie',
                  style: TextStyle(fontSize: 50)
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateASmoothie()),
          );
        },
        backgroundColor: Color(0xFFF9AA33),
        tooltip: 'Increment',
        //backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
