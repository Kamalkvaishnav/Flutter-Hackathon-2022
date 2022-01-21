import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/splash.dart';
import 'package:mess_app/loading.dart';
import 'package:mess_app/utilities/gsheets.dart';
import 'package:mess_app/order/profileModel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ProfileModel> profile = [ProfileModel()];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Gsheet sheet = Gsheet('1dFR1hus3VY2zryi8b2QD2FmY9dpqQdupwmLChyXRSdk');
    sheet.readData("StudentDetails").then((value) {
      profile.add(ProfileModel(
        profile_id: value[1][0],
        profile_name: value[1][1],
        profile_email: value[1][2],
        profile_rollNo: value[1][3],
        profile_url: value[1][4],
      ));
      print(value);
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (!isLoading)
            ? const FirstLoading()
            : Scaffold(
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 270,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/xy.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ),
                          Positioned(
                            bottom: -72.5,
                            left: 115.25,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 2,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                backgroundImage:
                                    NetworkImage(profile[1].profile_url),
                                radius: 60,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(height: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hey! ",
                            style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            profile[1].profile_name,
                            style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 40, 158, 255),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        profile[1].profile_email,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.blue,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        //color : Colors.red,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 90,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/restaurant.png"),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  //color : Colors.blue,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/crowd.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 3,
                                        spreadRadius: 0.1,
                                      ),
                                    ],
                                  ),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  //color : Colors.blue[300],
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          width: 1.0,
                                          color: Colors.blue,
                                        ),
                                        primary: Colors.white),
                                    child: Text(
                                      'Mess Portal',
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/messportal');
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 3,
                                        spreadRadius: 0.1,
                                      ),
                                    ],
                                  ),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  //color : Colors.red,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          width: 1.0,
                                          color: Colors.blue,
                                        ),
                                        primary: Colors.white),
                                    child: Text(
                                      'Mess Traffic',
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/traffic');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        //color: Colors.yellow,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 1.0,
                                color: Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              primary: Colors.white,
                              shadowColor: Colors.blue),
                          child: Text(
                            'Feedback',
                            style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/feedback');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
    ;
  }
}
