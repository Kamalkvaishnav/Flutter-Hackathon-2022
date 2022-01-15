import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/messDetails.dart';
import 'package:mess_app/messPass.dart';
import 'package:mess_app/studentProfile.dart';

class MessPortal extends StatefulWidget {
  const MessPortal({Key? key}) : super(key: key);

  @override
  _MessPortalState createState() => _MessPortalState();
}

class _MessPortalState extends State<MessPortal> {
  int _currentIndex = 0;
  final tabs = [StudentProfile(), MessPass(), MessDetails()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Mess Portal', style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                            ),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        backgroundColor: Colors.grey[700],
        selectedItemColor: Colors.yellow[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Student Profile',
            backgroundColor: Colors.green[400],
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'Mess Pass',
            backgroundColor: Colors.blue[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Mess Details',
            backgroundColor: Colors.red[400],
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    ;
  }
}
