import 'package:flutter/material.dart';
import 'package:when_to_leave/item.dart';
import 'package:when_to_leave/additemspage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleScreen createState() => _ScheduleScreen();
}

class _ScheduleScreen extends State<ScheduleScreen> {

  @override
  Widget build(BuildContext context) {
    final test = context.dependOnInheritedWidgetOfExactType<ItemWidget>();
    final test2 = ItemWidget.of(context);
    List<Item> mondayEvents = <Item>[];
    List<Item> tuesdayEvents = <Item>[];
    List<Item> wednesdayEvents = <Item>[];
    List<Item> thursdayEvents = <Item>[];
    List<Item> fridayEvents = <Item>[];
    List<Item> saturdayEvents = <Item>[];
    List<Item> sundayEvents = <Item>[];
    List<Item> testEvents = <Item>[];
    mondayEvents.add(new Item(null,"monday",null,null));
    tuesdayEvents.add(new Item(null,"tuesday",null,null));
    wednesdayEvents.add(new Item(null,"wednesday",null,null));
    thursdayEvents.add(new Item(null,"thursday",null,null));
    fridayEvents.add(new Item(null,"friday",null,null));
    saturdayEvents.add(new Item(null,"saturday",null,null));
    sundayEvents.add(new Item(null,"sunday",null,null));
    testEvents.add(new Item(null,"test",null,null));

    Position position;

    void getCurrentLocation() async {
      Position res = await Geolocator().getCurrentPosition();
      setState((){
        position = res;
      });
    }

    if (test != null){
      if (test.newItem.day.toLowerCase() == "monday")
        mondayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "tuesday")
        tuesdayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "wednesday")
        wednesdayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "thursday")
        thursdayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "friday")
        fridayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "saturday")
        saturdayEvents.add(test.newItem);
      else if (test.newItem.day.toLowerCase() == "sunday")
        sundayEvents.add(test.newItem);
    }


    return Scaffold(
      backgroundColor: Colors.cyan[100],
        resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
          )],
      ),
        body: PageView(
          children: <Widget>[
            monday(mondayEvents), tuesday(tuesdayEvents), wednesday(wednesdayEvents),
            thursday(thursdayEvents), friday(fridayEvents), saturday(saturdayEvents),
            sunday(sundayEvents)
          ],
        )
      );
  }
}


Widget monday(List<Item> mondayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Work", "Monday", "08:00", "9328 Hope St, Irvine 92602");
  Item test2 = new Item("Lunch with Jerry", "Monday", "12:30", "2383 Dawn Ave, Anaheim 90721");
  Item test3 = new Item("Meeting with Manager", "Monday", "14:00", "3629 N Verner St, Cerritos 92604");
  Item test4 = new Item("Make Dinner", "Monday", "17:00", "5172 Orange Ave, Cypress 90630");
  mondayEventsList.add(test);
  mondayEventsList.add(test2);
  mondayEventsList.add(test3);
  mondayEventsList.add(test4);

  return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          itemCount: mondayEventsList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0){
              return Container(
                  height: 80,
                  color: Colors.white70,
                  child: Center(child: Text(
                      'Monday Schedule',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 39, // 26
                        color: Colors.black,
                      )
                  ),)
                //Text('Item $index: ${mondayEvents[index]}')),
                //Center(child: Text('Item $index: ${mondayEvents[index]}')),
              );
            }
            else
             return Container(
                height: 80,
                color: Colors.amber[colorCodes[index%2]],
                child: InkWell(
                  child: Center(child: Text('Item $index: ${mondayEventsList[index]}')))
                  //Text('Item $index: ${mondayEvents[index]}')),
                  //Center(child: Text('Item $index: ${mondayEvents[index]}')),
              );
            },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
}

Widget tuesday(List<Item> tuesdayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Class", "Tuesday", "10:00", "3801 W Temple Ave, Pomona 91768");
  Item test2 = new Item("Lunch with Cameron", "Tuesday", "12:00", "3425 Pomona Blvd, Pomona 91768");
  Item test3 = new Item("Home for Dinner", "Tuesday", "18:00", "5172 Orange Ave, Cypress 90630");
  tuesdayEventsList.add(test);
  tuesdayEventsList.add(test2);
  tuesdayEventsList.add(test3);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: tuesdayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Tuesday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 39, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${tuesdayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget wednesday(List<Item> wednesdayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Work", "Wednesday", "08:00", "9328 Hope St, Irvine 92602");
  Item test2 = new Item("Lunch with Andrew", "Wednesday", "11:45", "2383 Dawn Ave, Anaheim 90721");
  Item test3 = new Item("Meeting with Team", "Wednesday", "13:00", "3629 N Verner St, Cerritos 92604");
  Item test4 = new Item("Club Meeting", "Wednesday", "14:30", "3425 Pomona Blvd, Pomona 91768");
  Item test5 = new Item("Stop by Market", "Wednesday", "16:00", "2381 Citrus Ave, Brea 90821");
  Item test6 = new Item("Make Dinner", "Wednesday", "17:00", "5172 Orange Ave, Cypress 90630");
  wednesdayEventsList.add(test);
  wednesdayEventsList.add(test2);
  wednesdayEventsList.add(test3);
  wednesdayEventsList.add(test4);
  wednesdayEventsList.add(test5);
  wednesdayEventsList.add(test6);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: wednesdayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Wednesday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 32, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${wednesdayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget thursday(List<Item> thursdayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Class", "Thursday", "10:00", "3801 W Temple Ave, Pomona 91768");
  Item test2 = new Item("Lunch with Ethan", "Thursday", "12:00", "1948 Pomona Blvd, Pomona 91768");
  Item test3 = new Item("Home for Dinner", "Thursday", "18:00", "5172 Orange Ave, Cypress 90630");
  Item test4 = new Item("Gym with Friends", "Thursday", "18:00", "2938 Block Dr, Anaheim 90274");
  thursdayEventsList.add(test);
  thursdayEventsList.add(test2);
  thursdayEventsList.add(test3);
  thursdayEventsList.add(test4);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: thursdayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Thursday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 34, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${thursdayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget friday(List<Item> fridayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Work", "friday", "09:00", "2384 W Sea Ave, Diamond Bar 91768");
  Item test2 = new Item("Lunch with Team", "friday", "12:00", "1948 Blue Ave, Diamond Bar  91768");
  Item test3 = new Item("Home for Dinner", "friday", "18:00", "5172 Orange Ave, Cypress 90630");
  Item test4 = new Item("Church", "friday", "19:00", "5393 S Sanderson Dr, Anaheim 90274");
  fridayEventsList.add(test);
  fridayEventsList.add(test2);
  fridayEventsList.add(test3);
  fridayEventsList.add(test4);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: fridayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Friday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 39, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${fridayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget saturday(List<Item> saturdayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Beach with friends", "saturday", "12:00", "2321 Pacific Blvd, Newport CA 91768");
  saturdayEventsList.add(test);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: saturdayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Saturday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 39, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${saturdayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget sunday(List<Item> sundayEventsList){
  List<int> colorCodes = <int>[300, 100];

  Item test = new Item("Church", "sunday", "12:00", "2321 Pacific Blvd, Newport 91768");
  Item test2 = new Item("Meet with group", "sunday", "14:00", "3801 W Temple Ave, Pomona 91768");
  sundayEventsList.add(test);
  sundayEventsList.add(test2);

  return ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    itemCount: sundayEventsList.length,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0){
        return Container(
            height: 80,
            color: Colors.white70,
            child: Center(child: Text(
                'Sunday Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 39, // 26
                  color: Colors.black,
                )
            ),)
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
      }
      else
        return Container(
            height: 80,
            color: Colors.amber[colorCodes[index%2]],
            child: InkWell(
                child: Center(child: Text('Item $index: ${sundayEventsList[index]}')))
          //Text('Item $index: ${mondayEvents[index]}')),
          //Center(child: Text('Item $index: ${mondayEvents[index]}')),
        );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}