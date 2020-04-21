import 'package:flutter/material.dart';
import 'package:when_to_leave/additemspage.dart';
import 'package:geolocator/geolocator.dart';

class Item {
  String name;
  String day;
  String time;
  String location;

  Item(this.name, this.day, this.time, this.location);

  // Named constructor
  Item.nameInit(String newName){
    name = newName;
  }

  //String toString() => '$name\nTime: ' + time.toString() + "\nLocation: $location";

  String toString(){
    if (name.toLowerCase() == "monday" || name.toLowerCase() == "tuesday" || name.toLowerCase() == "wednesday" || name.toLowerCase() == "thursday"
      || name.toLowerCase()  == "friday"|| name.toLowerCase() == "saturday" || name.toLowerCase() == "sunday")
      return '$name';
    else
      return '$name\nTime: ' + time.toString() + "\nLocation: $location";
  }

  String convertIndex(int ind){
    if (ind == 0)
      return "Monday";
    else if (ind == 1)
      return "Tuesday";
    else if (ind == 2)
      return "Wednesday";
    else if (ind == 3)
      return "Thursday";
    else if (ind == 4)
      return "Friday";
    else if (ind == 5)
      return "Saturday";
    else if (ind == 6)
      return "Sunday";
    else
      return null;
  }

  bool isWeekDay(String value){
    String newVal = value.toLowerCase();

    if (newVal != "monday" && newVal != "tuesday" && newVal != "wednesday"
        && newVal != "thursday" && newVal != "friday" && newVal != "saturday" && newVal != "sunday")
      return false;
    else
      return true;
  }

  void convertToTimeOfDay(String value){

  }


  void save(){
    print("worked");
  }

}

