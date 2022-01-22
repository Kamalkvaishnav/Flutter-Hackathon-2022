import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/loading.dart';
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
      print(value);
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!isLoading)
        ? const Loading()
        : Scaffold(
            body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profile[1].profile_url),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hey! ', style: TextStyle(fontSize: 30)),
                  Text(profile[1].profile_name,
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
                            'Name',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          profile[1].profile_name,
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
                            'Email',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          profile[1].profile_email,
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
                            'Mobile No.',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          '8824021960',
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
                            'Roll No.',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          profile[1].profile_rollNo,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
            ])),
          ));
  }
}
