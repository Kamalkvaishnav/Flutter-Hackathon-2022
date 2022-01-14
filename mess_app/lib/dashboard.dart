import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202103/photo-1511367461989-f85a21fda1_0_1200x768.jpeg?YVCV8xj2CmtZldc_tJAkykymqxE3fxNf&size=770:433'),
                ),
                SizedBox(height: 10),
                Text('Preetam',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 5),
                Text('preetam.iitgn.ac.in',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 30),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      height: 50,
                      width: 500,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.food_bank,
                              size: 35,
                              color: Colors.white,
                            ),
                          ), SizedBox(width: 40,),
                           Text(
                          'Mess Portal',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Icon(Icons.arrow_forward, size: 30.0, color: Colors.white, ),
                        )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      height: 50,
                      width: 500,
                      child:  Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.people,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 30,),
                           Text(
                          'Traffic in Mess',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Icon(Icons.arrow_forward, size: 30.0, color: Colors.white, ),
                        )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      height: 50,
                      width: 500,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.feedback,
                              size: 35,
                              color: Colors.white,
                            ),
                          ), SizedBox(width: 50,),
                           Text(
                          'Feedback',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Icon(Icons.arrow_forward, size: 30.0, color: Colors.white, ),
                        )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
