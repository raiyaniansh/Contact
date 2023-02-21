import 'dart:io';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';


class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController txtfname = TextEditingController();
  TextEditingController txtlname = TextEditingController();
  TextEditingController txtnum = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  String? l2;
  String data = 'Mobile';
  String Path = '';
  var key1 = GlobalKey<FormState>();
  int i=0;

  String? a;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.close, color: Color(0xffc7b092))),
          title: Text(
            "Create contact",
            style: TextStyle(
              color: Color(0xffc7b092),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () async {
                  if(key1.currentState!.validate()){
                    if(Path.isEmpty)
                      {
                        Path='';
                      }
                    else
                      {
                        Path=Path;
                      }
                    img.add(Path);
                    fname.add(txtfname.text);
                    lname.add(txtlname.text);
                    email.add(txtemail.text);
                    num.add(txtnum.text);
                    lab.add(data);
                    print(lab);
                    SharedPreferences shfname = await SharedPreferences.getInstance();
                    shfname.setStringList('fname', fname);
                    SharedPreferences shlname = await SharedPreferences.getInstance();
                    shlname.setStringList('lname', lname);
                    SharedPreferences shemail = await SharedPreferences.getInstance();
                    shemail.setStringList('email', email);
                    SharedPreferences shnum = await SharedPreferences.getInstance();
                    shnum.setStringList('num', num);
                    SharedPreferences shdata = await SharedPreferences.getInstance();
                    shdata.setStringList('lab', lab);
                    SharedPreferences shimg = await SharedPreferences.getInstance();
                    shimg.setStringList('img', img);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 10,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Color(0xffc7b092),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child:
                      Text("Save", style: TextStyle(color: Color(0xff1F1C17))),
                ),
              ),
            )
          ],
        ),
        body: Form(
          key: key1,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff58422B),
                      shape: BoxShape.circle,
                    ),
                    child: (Path.isEmpty)
                        ? Icon(Icons.add_photo_alternate_outlined,
                            color: Color(0xffc7b092), size: 65)
                        : CircleAvatar(
                            backgroundImage: FileImage(File(Path)),
                            maxRadius: 62.5),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () async {
                        ImagePicker img = ImagePicker();
                        XFile? xfile =
                            await img.pickImage(source: ImageSource.gallery);
                        setState(() {
                          Path = xfile!.path;
                        });
                      },
                      child: Text("Add picture",
                          style: TextStyle(
                            color: Color(0xffF9B971),
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: Color(0xffc7b092)),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 275, child: text(txtfname, 'First name')),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(width: 275, child: text(txtlname, 'Last name')),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.call, color: Color(0xffc7b092)),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 275,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: txtnum,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Color(0xffc7b092),
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(color: Color(0xffc7b092)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffc7b092)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffc7b092)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if(value!.length!=10)
                            {
                              return "Please enter valid Phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffc7b092))),
                        width: 125,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(5),
                            dropdownColor: Color(0xff1c1913),
                            items: [
                              DropdownMenuItem(
                                  child: Text("Mobile",
                                      style: TextStyle(color: Colors.white)),
                                  value: 'Mobile'),
                              DropdownMenuItem(
                                child: Text("Work",
                                    style: TextStyle(color: Colors.white)),
                                value: 'Work',
                              ),
                              DropdownMenuItem(
                                  child: Text("Home",
                                      style: TextStyle(color: Colors.white)),
                                  value: 'Home'),
                              DropdownMenuItem(
                                  child: Text("Main",
                                      style: TextStyle(color: Colors.white)),
                                  value: 'Main'),
                            ],
                            onChanged: (value) {
                              setState(() {
                                data = value!;
                              });
                            },
                            value: data,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail_outline, color: Color(0xffc7b092)),
                      SizedBox(
                        width: 5,
                      ),
                      Container(width: 275, child: text(txtemail, 'Email id')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget text(TextEditingController a, String b) {
    return TextField(
      controller: a,
      style: TextStyle(color: Colors.white),
      cursorColor: Color(0xffc7b092),
      decoration: InputDecoration(
        hintText: b,
        hintStyle: TextStyle(color: Color(0xffc7b092)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7b092)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffc7b092)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
