import 'package:flutter/material.dart';

class Setting {
 bool notif;
 double cushionMinutes;

 Setting(this.notif, this.cushionMinutes);

 String toString(){
   return "$cushionMinutes";
 }
}

