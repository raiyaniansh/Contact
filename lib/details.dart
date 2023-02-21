import 'dart:io';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    int ind=ModalRoute.of(context)?.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'update',arguments: ind).then((value) {
                  setState(() {

                  });
                },);
              },
              child: Icon(Icons.edit),
            ),
            SizedBox(width: 5,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                (img[ind]=='')?Container(
                  width: 125,
                  height: 125,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text("${fname[ind].substring(0,1)}",style: TextStyle(color: Colors.white,fontSize: 85)),
                ):CircleAvatar(
                  maxRadius: 62.5,
                  backgroundImage: FileImage(File("${img[ind]}")),
                ),
                SizedBox(height: 20,),
                Text("${fname[ind]} ${lname[ind]}",style: TextStyle(color: Colors.white,fontSize: 25),),
                SizedBox(height: 10,),
                Container(height: 1,width: double.infinity,color: Color(0xffF9B971),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async{
                        await launchUrl(Uri.parse("tel:${num[ind]}"));
                      },
                      child: Column(
                        children: [
                          Icon(Icons.call,color: Color(0xffF9B971),size: 35),
                          SizedBox(height: 5,),
                          Text("Call",style: TextStyle(color: Color(0xffF9B971)),)
                        ],
                      ),
                    ),
                    SizedBox(width: 50,),
                    InkWell(
                      onTap: () async{
                        await launchUrl(Uri.parse("sms:${num[ind]}"));
                      },
                      child: Column(
                        children: [
                          Icon(Icons.sms_outlined,color: Color(0xffF9B971),size: 35),
                          SizedBox(height: 5,),
                          Text("Text",style: TextStyle(color: Color(0xffF9B971)),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(height: 1,width: double.infinity,color: Color(0xffF9B971),),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff4F453B),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Contact info",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            InkWell(onTap: () async{
                              await launchUrl(Uri.parse("tel:${num[ind]}"));
                            },child: Icon(Icons.call,color: Colors.white,size: 28,)),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () async{
                                await launchUrl(Uri.parse("tel:${num[ind]}"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("+91 ${num[ind]}",style: TextStyle(color: Colors.white,fontSize: 18)),
                                  Text("${lab[ind]}",style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            InkWell(onTap: () async{
                              await launchUrl(Uri.parse("sms:${num[ind]}"));
                            },child: Icon(Icons.sms_outlined,color: Colors.white,size: 28 ,))
                          ],
                        ),
                      ),
                      (email[ind].isNotEmpty)?Padding(
                        padding: const EdgeInsets.only(left: 10,bottom: 10),
                        child: Row(
                          children: [
                            Icon(Icons.mail_outline,color: Colors.white,size: 28,),
                            SizedBox(width: 10,),
                            Text("${email[ind]}",style: TextStyle(color: Colors.white,fontSize: 18)),
                          ],
                        ),
                      ):Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
