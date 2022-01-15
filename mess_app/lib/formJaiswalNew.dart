import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormJaiswalNew extends StatefulWidget {
  const FormJaiswalNew({Key? key}) : super(key: key);

  @override
  State<FormJaiswalNew> createState() => _FormJaiswalNewState();
}

class _FormJaiswalNewState extends State<FormJaiswalNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Jaiswal mess',
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
