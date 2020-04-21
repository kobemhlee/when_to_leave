import 'package:flutter/material.dart';
import 'package:when_to_leave/item.dart';
import 'package:provider/provider.dart';
import 'package:when_to_leave/events.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';

class AddItems extends StatefulWidget {
  AddItems ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddItemsScreen createState() => _AddItemsScreen();
}

_scheduleNotification() async {
  int notificationId = await ScheduledNotifications.scheduleNotification(
      new DateTime.now().add(new Duration(seconds: 5)).millisecondsSinceEpoch,
      "Ticker text",
      "Event",
      "Content");
}

class _AddItemsScreen extends State<AddItems> {
  final _newItem = Item(null, null, null, null);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.event,
              color: Colors.white,
            ),
          )],
      ),
      body: Center(
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                  child: Text(
                      'Create Event',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 39, // 26
                        color: Colors.black,
                      )
                  ),

                ),
                TextFormField(
                    decoration:
                      const InputDecoration(
                          labelText: 'Event Name',
                          icon: Icon(Icons.add_circle),
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter event name.';
                      }
                    },
                    onSaved: (val) =>
                        setState(() => _newItem.name = val),
                ),
                TextFormField(
                    decoration:
                    const InputDecoration(
                      labelText: 'Day (Monday, Tuesday, etc)',
                      icon: Icon(Icons.calendar_today),
                    ),
                    validator: (value){
                      String newVal = value.toLowerCase();
                      if (value.isEmpty){
                        return 'Please enter day of occurrence (Monday, Tuesday... etc).';
                      }
                      if  (newVal != "monday" && newVal != "tuesday" && newVal != "wednesday"
                      && newVal != "thursday" && newVal != "friday" && newVal != "saturday" && newVal != "sunday"){
                        return 'Please enter day of occurrence (Monday, Tuesday... etc).';
                      }
                      },
                      onSaved: (val) =>
                        setState(() => _newItem.day = val),
                ),
                TextFormField(
                    decoration:
                    const InputDecoration(
                      labelText: 'Time (Format: HH:MM, 24-Hour Format)',
                      icon: Icon(Icons.access_time),
                    ),
                    validator: (value){
                      if (value.isEmpty){
                        return 'Please enter time of event. Ex: 22:30 for 10:30 PM';
                      }
                      if (value.length != 5 || value.substring(2,3) != ":"){
                        return 'Please enter time of event. Ex: 22:30 for 10:30 PM';
                      }
                      if (int.parse(value.substring(0,2)) > 23){
                        return 'Please enter time of event. Hour field can be 0-23';
                      }
                      },
                      onSaved: (val) =>
                        setState(() => _newItem.time = val),
                ),
                TextFormField(
                  decoration:
                  const InputDecoration(
                    labelText: 'Location (Address Format)',
                    icon: Icon(Icons.add_location),
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Please enter location. Ex: 3801 W Temple Ave, Pomona, CA 91768';
                    }
                  },
                   onSaved: (val) =>
                    setState(() => _newItem.location = val),
                ),
                Container(
                  width: 80.0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 12.0,
                  ),
                  child: RaisedButton(onPressed: (){
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      _newItem.save();
                      _showDialog((context));
                    }
                    _scheduleNotification();
                  },
                      child: Text('Add Event'),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.white,
                      highlightColor: Colors.orangeAccent,
                ),

                ),
              ]
            )
          )
        ),
      ),
    );
  }
  _showDialog(BuildContext context){
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Event Added to Schedule.')));
  }
}

class ItemWidget extends InheritedWidget {

  final Item newItem;

  ItemWidget({this.newItem, Widget child}) : super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //final widget = context.dependOnInheritedWidgetOfExactType<ItemWidget>();
  static ItemWidget of (BuildContext context) => context.dependOnInheritedWidgetOfExactType<ItemWidget>();
}
