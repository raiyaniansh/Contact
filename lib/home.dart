import 'dart:async';
import 'dart:io';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text("Contacts",style: TextStyle(
            color: Color(0xffc7b092),
          ),),
        ),
        body: Stack(
          children: [
            ListView.builder(itemCount: fname.length,itemBuilder: (context, index) {
              return Box(fname[index],img[index],index);
            },),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, 'add').then((value) {setState(() {});},);
                    });
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff6A3C00)
                    ),
                    child: Icon(Icons.add,color: Color(0xffc7b092),size: 40),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget Box(String a,String b,index)
  {
    return ListTile(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, 'details',arguments: index).then((value) {
            setState(() {

            });
          },);
        });
      },

      leading: (img[index]=='')?Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle
        ),
        alignment: Alignment.center,
        child: Text("${fname[index].substring(0,1)}",style: TextStyle(color: Colors.white,fontSize: 25)),
      ):CircleAvatar(backgroundImage: FileImage(File('$b'))),
      title: Text("$a",style: TextStyle(color: Colors.white)),
    );
  }
}
