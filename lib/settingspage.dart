import 'package:flutter/material.dart';
import 'package:when_to_leave/settings.dart';

// notifications checkbox, minutes of leeway

class Settings extends StatefulWidget {
  Settings ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<Settings> {
  final _newSetting = Setting(false, 0);
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
              Icons.settings,
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
                            'Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 44, // 26
                              color: Colors.black,
                            )
                        ),

                        ),
                        SwitchListTile(
                            title: const Text("Notifications"),
                            value: _newSetting.notif,
                            onChanged: (bool val) =>
                              setState(() => _newSetting.notif = val),
                        ),
                        Text(
                          '    Amount of Time Cushion (Minutes)',
                          style: TextStyle(
                            //fontFamily: 'Montserrat',
                            //fontWeight: FontWeight.w100,
                            fontSize: 15.2,
                            color: Colors.black87,
                          )
                        ),
                        Slider(
                            //title: const Text("Number of \"Cushion Minutes\"")
                            value: _newSetting.cushionMinutes,
                            onChanged: (double val) =>
                              setState(() => _newSetting.cushionMinutes = val),
                            min: 0,
                            max: 30,
                            divisions: 6,
                            label: "$_newSetting",
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
