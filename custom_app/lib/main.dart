import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        //buttonColor: Colors.black12,
        //backgroundColor: Colors.orange,
        //primaryColor: Colors.black26,    broken?
        //secondaryHeaderColor: Colors.orangeAccent,
      ),
      home: MyHomePage(title: 'Custom'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              title: Text('Page 1'),
              onTap: (){
                Navigator.pop(context); //closes NavDrawer
                //Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => PageName()),
                //);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: (){

                Navigator.pop(context); //closes NavDrawer
                //Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => PageName()),
                //);
              },
            ),
            //To add more pages, copy and paste the ListTile then update text
            //and MaterialPageRoute to the correct name and page.
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
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
        onPressed: () {},
        backgroundColor: Color(0xFFF9AA33),
        tooltip: 'Increment',
        //backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}
