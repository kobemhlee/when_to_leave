import 'package:flutter/material.dart';
import 'package:when_to_leave/schedulescreen.dart';
import 'package:when_to_leave/additemspage.dart';
import 'package:when_to_leave/removeitemspage.dart';
import 'package:when_to_leave/settingspage.dart';
import 'package:when_to_leave/style.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.g

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'When To Leave',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(title: AppBarTextStyle)
      ),
      home: (MyHomePage(title: 'Home'))
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToScheduleScreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScheduleScreen(title: 'Schedule')),
      );
    });
  }

  void _goToAddItemsScreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddItems(title: '')),
      );
    });
  }

  void _goToRemoveItemsScreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RemoveItems(title: 'Remove Events')),
      );
    });
  }

  void _goToSettingsScreen() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings(title: 'Settings')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
          icon: Icon(
          Icons.home,

          color: Colors.white,
      ),
          )],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'When To Leave',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 50, // 26
                color: Colors.black,
              )
            ),
            Image(
                image: AssetImage("assets/schedule.png"),
                width: 150,
                height: 150,
            ),
            new SizedBox(
              width: 150.0,
              //height: 100.0,
              child: new RaisedButton(
                onPressed: _goToScheduleScreen,
                child: Text(
                    "My Schedule",
                    style: Theme.of(context).textTheme.title
                ),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.white,
                highlightColor: Colors.orangeAccent,
              ),
            ),
            new SizedBox(
              width: 150.0,
              //height: 100.0,
              child: new RaisedButton(
                onPressed: _goToAddItemsScreen,
                child: Text(
                    "Add Events",
                    style: Theme.of(context).textTheme.title
                ),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.white,
                highlightColor: Colors.orangeAccent,
              ),
            ),
            new SizedBox(
              width: 150.0,
              //height: 100.0,
              child: new RaisedButton(
                onPressed: _goToRemoveItemsScreen,
                child: Text(
                    "Remove Events",
                    style: Theme.of(context).textTheme.title
                ),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.white,
                highlightColor: Colors.orangeAccent,
              ),
            ),
            new SizedBox(
              width: 150.0,
              //height: 100.0,
              child: new RaisedButton(
                onPressed: _goToSettingsScreen,
                child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.title
                ),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.white,
                highlightColor: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
