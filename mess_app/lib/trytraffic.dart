import 'dart:math';

import 'package:flutter/material.dart';

var upperMessCap = 30;
var lowerMessCap = 30;
var newMessCap = 25;
var curUpperMess = 21;
var curNewMess = 19;
var curLowermess = 11;

class TrafficUI extends StatefulWidget {
  const TrafficUI({Key? key}) : super(key: key);

  @override
  _TrafficUIState createState() => _TrafficUIState();
}

class _TrafficUIState extends State<TrafficUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/Appbar.png'))),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
              Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(
                          -4.0,
                          4.0,
                        ),
                        blurRadius: 4.0),
                    BoxShadow(color: Colors.white)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Mohini", style: TextStyle(fontSize: 25)),
                        Text("(Lower)", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Stack(children: <Widget>[
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: (curLowermess) / (lowerMessCap),
                          backgroundColor: Colors.grey[300],
                          strokeWidth: 5,
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 30,
                          child: Text(curLowermess.toString() +
                              '/' +
                              lowerMessCap.toString()))
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(
                          -4.0,
                          4.0,
                        ),
                        blurRadius: 4.0),
                    BoxShadow(color: Colors.white)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Jaiswal", style: TextStyle(fontSize: 25)),
                        Text("(New)", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Stack(children: <Widget>[
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: (curNewMess) / (newMessCap),
                          backgroundColor: Colors.grey[300],
                          strokeWidth: 5,
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 30,
                          child: Text(curNewMess.toString() +
                              '/' +
                              newMessCap.toString()))
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(
                          -4.0,
                          4.0,
                        ),
                        blurRadius: 4.0),
                    BoxShadow(color: Colors.white)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Jaiswal", style: TextStyle(fontSize: 25)),
                        Text("(Upper)", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Stack(children: <Widget>[
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: (curUpperMess) / (upperMessCap),
                          backgroundColor: Colors.grey[300],
                          strokeWidth: 5,
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 30,
                          child: Text(curUpperMess.toString() +
                              '/' +
                              upperMessCap.toString()))
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
