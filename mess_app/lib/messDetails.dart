import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/loading.dart';
import 'package:mess_app/utilities/gsheets.dart';
import 'package:mess_app/order/messModel.dart';

class MessDetails extends StatefulWidget {
  const MessDetails({Key? key}) : super(key: key);

  @override
  _MessDetailsState createState() => _MessDetailsState();
}

class _MessDetailsState extends State<MessDetails> {
  List<MessModel> messProfile = [MessModel()];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    Gsheet sheet = Gsheet('1dFR1hus3VY2zryi8b2QD2FmY9dpqQdupwmLChyXRSdk');
    sheet.readData("MessDetails").then((value) {
      messProfile.add(MessModel(
          mess_id: value[1][1],
          mess_name: value[1][0],
          mess_end: value[1][3],
          mess_start: value[1][2],
          user_name: value[1][4]));
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!isLoading)
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
              SizedBox(height: 20),
              // CircleAvatar(
              //   radius: 60,
              //   backgroundImage: NetworkImage(messProfile[1].user_name),
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hey! ', style: TextStyle(fontSize: 30)),
                  Text(messProfile[1].user_name,
                      style: TextStyle(color: Colors.blue, fontSize: 30))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Text(
                            'Mess Name',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          messProfile[1].mess_name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Text(
                            'Acadmic Semester',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'B.Tech Sem-2',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Text(
                            'Mess Duration From',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          messProfile[1].mess_start,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Text(
                            'To',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          messProfile[1].mess_end,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
            ])),
          ));
  }
}




