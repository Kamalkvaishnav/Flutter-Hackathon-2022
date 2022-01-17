import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/order/profileModel.dart';
import 'package:mess_app/utilities/gsheets.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  bool isLoading = false;
  List<ProfileModel> profile = [ProfileModel()];

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
        // profile_url: value[1][4]
      ));
      setState(() {
        ;
      });
    });
    print(profile);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Center(
                child: Text("Please Wait...",
                    style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 148, 147, 147),
                        fontSize: 30,
                        fontWeight: FontWeight.w700))))
        : Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Hey, ' + profile[0].profile_name,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[600]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            profile[0].profile_name,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[600]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Male',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[600]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            profile[0].profile_rollNo,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[600]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            profile[0].profile_email,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Container();
  // }

