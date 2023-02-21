import 'dart:io';

import 'package:flutter/material.dart';
import 'package:contact/main.dart';
import 'package:image_picker/image_picker.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    String data = '${lab[ind]}';
    String Path = '${img[ind]}';
    TextEditingController txtfname =
        TextEditingController(text: '${fname[ind]}');
    TextEditingController txtlname =
        TextEditingController(text: '${lname[ind]}');
    TextEditingController txtnum =
        TextEditingController(text: '${num[ind]}');
    TextEditingController txtemail =
        TextEditingController(text: '${email[ind]}');
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
                onTap: () {
                  setState(() {
                    if(key1.currentState!.validate())
                    {
                      Navigator.pop(context);
                    }
                  });
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
                            if (value!.length != 10) {
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
