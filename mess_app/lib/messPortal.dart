import 'package:flutter/material.dart';

class MessPortal extends StatefulWidget {
  const MessPortal({Key? key}) : super(key: key);

  @override
  _MessPortalState createState() => _MessPortalState();
}

class _MessPortalState extends State<MessPortal> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Mess Portal'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 30,
        
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
