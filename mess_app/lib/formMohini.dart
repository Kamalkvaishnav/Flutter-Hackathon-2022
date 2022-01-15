import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormMohini extends StatefulWidget {
  const FormMohini({Key? key}) : super(key: key);

  @override
  State<FormMohini> createState() => _FormMohiniState();
}

class _FormMohiniState extends State<FormMohini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mohini mess',
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
