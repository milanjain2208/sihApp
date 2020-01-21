import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/Services/pdf_creator.dart';
import 'package:sih_app/Shared/constants.dart';
class PrescriptionFormat extends StatelessWidget {
  final Function changePage;
  final text1=TextEditingController();
  final text2=TextEditingController();
  final text3=TextEditingController();
  final text4=TextEditingController();
  PrescriptionFormat({this.changePage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                    TextFormField(
                    decoration: textFormDecoration.copyWith(hintText: 'Doctor Name' ),
                      controller: text1,
                  ),
                SizedBox(
                  height: 30,
                ),
                   TextFormField(
                    decoration:  textFormDecoration.copyWith(hintText: 'Doctor Type'),
                     controller: text2,
                  ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: textFormDecoration.copyWith(hintText: 'Phone Number'),
                  controller: text3,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: textFormDecoration.copyWith(hintText: 'Address'),
                  controller: text4,
                ),
              ],
            ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        onPressed: () async {
          String name=text1.text;
          String type=text2.text;
          String phoneNo=text3.text;
          String address=text4.text;
          String path=await pdfGenerator(name, type, phoneNo, address);
          changePage(0,path);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
