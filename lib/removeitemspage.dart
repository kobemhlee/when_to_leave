import 'package:flutter/material.dart';
import 'package:when_to_leave/item.dart';

class RemoveItems extends StatefulWidget {
  RemoveItems ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RemoveItemsScreen createState() => _RemoveItemsScreen();
}

class _RemoveItemsScreen extends State<RemoveItems> {
  final _newItem = Item(null, null, null, null);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Item> testEventsList = <Item>[];
    Item monday = new Item ("Monday", null, null,null);
    Item test = new Item("Work", "Monday", "08:00", "9328 Hope St, Irvine 92602");
    Item test2 = new Item("Lunch with Jerry", "Monday", "12:30", "2383 Dawn Ave, Anaheim 90721");
    Item test3 = new Item("Meeting with Manager", "Monday", "14:00", "3629 N Verner St, Cerritos 92604");
    Item test4 = new Item("Make Dinner", "Monday", "17:00", "5172 Orange Ave, Cypress 90630");
    Item tuesday = new Item ("Tuesday", null, null,null);
    Item wednesday = new Item ("Wednesday", null, null,null);
    Item thursday = new Item ("Thursday", null, null,null);
    Item friday = new Item ("Friday", null, null,null);
    Item saturday = new Item ("Saturday", null, null,null);
    Item sunday = new Item ("Sunday", null, null,null);

    testEventsList.add(monday);
    testEventsList.add(test);
    testEventsList.add(test2);
    testEventsList.add(test3);
    testEventsList.add(test4);

    testEventsList.add(tuesday);
    Item test5 = new Item("Class", "Tuesday", "10:00", "3801 W Temple Ave, Pomona 91768");
    Item test6 = new Item("Lunch with Cameron", "Tuesday", "12:00", "3425 Pomona Blvd, Pomona 91768");
    Item test7 = new Item("Home for Dinner", "Tuesday", "18:00", "5172 Orange Ave, Cypress 90630");
    testEventsList.add(test5);
    testEventsList.add(test6);
    testEventsList.add(test7);

    testEventsList.add(wednesday);
    Item test8 = new Item("Work", "Wednesday", "08:00", "9328 Hope St, Irvine 92602");
    Item test9 = new Item("Lunch with Andrew", "Wednesday", "11:45", "2383 Dawn Ave, Anaheim 90721");
    Item test10 = new Item("Meeting with Team", "Wednesday", "13:00", "3629 N Verner St, Cerritos 92604");
    Item test11 = new Item("Club Meeting", "Wednesday", "14:30", "3425 Pomona Blvd, Pomona 91768");
    Item test12 = new Item("Stop by Market", "Wednesday", "16:00", "2381 Citrus Ave, Brea 90821");
    Item test13 = new Item("Make Dinner", "Wednesday", "17:00", "5172 Orange Ave, Cypress 90630");
    testEventsList.add(test8);
    testEventsList.add(test9);
    testEventsList.add(test10);
    testEventsList.add(test11);
    testEventsList.add(test12);
    testEventsList.add(test13);

    testEventsList.add(thursday);
    Item test14 = new Item("Class", "Thursday", "10:00", "3801 W Temple Ave, Pomona 91768");
    Item test15 = new Item("Lunch with Ethan", "Thursday", "12:00", "1948 Pomona Blvd, Pomona 91768");
    Item test16 = new Item("Home for Dinner", "Thursday", "18:00", "5172 Orange Ave, Cypress 90630");
    Item test17 = new Item("Gym with Friends", "Thursday", "18:00", "2938 Block Dr, Anaheim 90274");
    testEventsList.add(test14);
    testEventsList.add(test15);
    testEventsList.add(test16);
    testEventsList.add(test17);

    testEventsList.add(friday);
    Item test18 = new Item("Work", "friday", "09:00", "2384 W Sea Ave, Diamond Bar 91768");
    Item test19 = new Item("Lunch with Team", "friday", "12:00", "1948 Blue Ave, Diamond Bar  91768");
    Item test20 = new Item("Home for Dinner", "friday", "18:00", "5172 Orange Ave, Cypress 90630");
    Item test21 = new Item("Church", "friday", "19:00", "5393 S Sanderson Dr, Anaheim 90274");
    testEventsList.add(test18);
    testEventsList.add(test19);
    testEventsList.add(test20);
    testEventsList.add(test21);

    testEventsList.add(saturday);
    Item test22 = new Item("Beach with friends", "saturday", "12:00", "2321 Pacific Blvd, Newport CA 91768");
    testEventsList.add(test22);

    testEventsList.add(sunday);
    Item test23 = new Item("Church", "sunday", "12:00", "2321 Pacific Blvd, Newport 91768");
    Item test24 = new Item("Meet with group", "sunday", "14:00", "3801 W Temple Ave, Pomona 91768");
    testEventsList.add(test23);
    testEventsList.add(test24);

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
          )
        ],
      ),
      body: Center(
        child: ListView(children: <Widget>[
          SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: testEventsList.length,
              itemBuilder: (BuildContext context, int index){
                final item = testEventsList[index];
                return Dismissible(
                  key: Key(item.name),
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    testEventsList.removeAt(index);

                    // Then show a snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("$item has been removed")));
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(title: Text('$item')),
                );
              }
            )
          )
        ])
      )
    );

  }
}