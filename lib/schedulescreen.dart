import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleScreen createState() => _ScheduleScreen();
}

class _ScheduleScreen extends State<ScheduleScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'My Schedule\n',
              style: Theme.of(context).textTheme.display3, // **style better later
            ),
            RaisedButton(
              onPressed:  ()  {

              },
              child: Text(
                  "My Schedule", style: TextStyle(
                //color: Colors.blueAccent
              )
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.white,
              highlightColor: Colors.orangeAccent,
            ),
            RaisedButton(
              onPressed:  ()  {

              },
              child: Text(
                  "Add Items"
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.white,
              highlightColor: Colors.orangeAccent,
            ),
            RaisedButton(
              onPressed:  ()  {

              },
              child: Text(
                  "Remove Items"
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.white,
              highlightColor: Colors.orangeAccent,
            ),
            RaisedButton(
              onPressed:  ()  {

              },
              child: Text(
                  "Settings"
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.white,
              highlightColor: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
