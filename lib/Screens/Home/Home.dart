import 'package:flutter/material.dart';
import 'package:sih_app/Screens/Prescription_Template.dart';
import 'package:sih_app/Services/auth.dart';
import 'package:sih_app/Services/pdf_viewer.dart';

import 'lists.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth=AuthService();
  String path;
  int page=1;
  void changePage(int p,String tp){
    setState(() {
      page=p;
      path=tp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return page==1?PrescriptionFormat(changePage: changePage):Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.tealAccent,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async {
            await _auth.logOut();
          },
              icon: Icon(Icons.person),
              label: Text("SignOut")),
          FlatButton(onPressed: ()  {
            setState(() {
              changePage(1,path);
            });
          },
              child: Text("Prescription")),
        ],
      ),
      body: Lists(),
      floatingActionButton: Container(
        width: 100,
        child: FloatingActionButton(
          child: Text("Preview",
            style: TextStyle(
              color: Colors.black,
            ),),
          backgroundColor: Colors.tealAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((10.0)),
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return PdfViewer(path: path);
            }));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
