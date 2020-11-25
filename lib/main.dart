


import 'package:flutter/material.dart';

import 'form_submission.dart';


void main() {
runApp(MaterialApp(
  home: MyApp(),

));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(
seconds: 3
    ),
        (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu()));

        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromRGBO( 62,140,31,1),
      body: Container(
        decoration: BoxDecoration(

        image: DecorationImage(
        image: AssetImage("assets/logo.png"),
    fit: BoxFit.contain,
    ),


)
        

      ),
    );
  }
}
