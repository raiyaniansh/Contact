import 'package:contact/add.dart';
import 'package:contact/details.dart';
import 'package:contact/home.dart';
import 'package:contact/theme.dart';
import 'package:contact/update.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


List<String> fname=[];
List<String> lname=[];
List<String> num =[];
List<String> email =[];
List<String> img =[];
List<String> lab =[];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences shfname = await SharedPreferences.getInstance();
  var sfname = shfname.getStringList('fname');
  SharedPreferences shlname = await SharedPreferences.getInstance();
  var slname = shlname.getStringList('lname');
  SharedPreferences shemail = await SharedPreferences.getInstance();
  var semail = shemail.getStringList('email');
  SharedPreferences shnum = await SharedPreferences.getInstance();
  var snum = shnum.getStringList('num');
  SharedPreferences shdata = await SharedPreferences.getInstance();
  var slab = shdata.getStringList('lab');
  SharedPreferences shimg = await SharedPreferences.getInstance();
  var simg = shimg.getStringList('img');
  // fname=await sfname!;
  // img=await simg!.map((i) => i.toString()).toList();
  // lname=slname!;
  // email=semail!;
  // num=snum!;
  // lab=slab!;
  print("===============$fname");
  print(sfname);
  print(slname);
  print(semail);
  print(slab);
  print(snum);
  print(simg);
  runApp(MaterialApp(
    theme: dark,
    debugShowCheckedModeBanner: false,
    routes: {
    '/':(context) => Home(),
    'add':(context) => Add(),
    'details':(context) => Details(),
    'update':(context) => Update(),

  },));
}
