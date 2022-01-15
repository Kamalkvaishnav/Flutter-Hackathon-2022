import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormJaiswalOld extends StatefulWidget {
  const FormJaiswalOld({Key? key}) : super(key: key);

  @override
  State<FormJaiswalOld> createState() => _FormJaiswalOldState();
}

class _FormJaiswalOldState extends State<FormJaiswalOld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Old Jaiswal mess',
          style: GoogleFonts.lato(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[400],
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back')),
      ),
    );
  }
}
