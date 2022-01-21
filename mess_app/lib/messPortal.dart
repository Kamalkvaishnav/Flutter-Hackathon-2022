import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/messDetails.dart';
import 'package:mess_app/messPass.dart';
import 'package:mess_app/pay.dart';
import 'package:mess_app/studentProfile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mess_app/preBooking.dart';

class MessPortal extends StatefulWidget {
  const MessPortal({Key? key}) : super(key: key);

  @override
  _MessPortalState createState() => _MessPortalState();
}

class _MessPortalState extends State<MessPortal> {
  int _currentIndex = 0;
  final tabs = [
    const StudentProfile(),
    const MessPass(),
    const MessDetails(),
    const PreBooking()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 162, 255),
        title: Text(
          'Mess Portal',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        itemCornerRadius: 24,
        animationDuration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        iconSize: 30,
        // selectedFontSize: 15,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // selectedItemColor: Colors.yellow[700],
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.person_sharp),
            title: const Text('Student Profile'),
            activeColor: Color.fromARGB(255, 2, 162, 255),
            inactiveColor: Color.fromARGB(255, 106, 109, 108),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.qr_code),
            title: const Text('Mess Pass'),
            activeColor: Color.fromARGB(255, 2, 162, 255),
            inactiveColor: Color.fromARGB(255, 106, 109, 108),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.food_bank),
            title: const Text('Mess Details'),
            activeColor: Color.fromARGB(255, 2, 162, 255),
            inactiveColor: Color.fromARGB(255, 106, 109, 108),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.book_online_sharp),
            title: const Text('Booking'),
            activeColor: Color.fromARGB(255, 2, 162, 255),
            inactiveColor: Color.fromARGB(255, 106, 109, 108),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
