import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessDetails extends StatefulWidget {
  const MessDetails({ Key? key }) : super(key: key);

  @override
  _MessDetailsState createState() => _MessDetailsState();
}

class _MessDetailsState extends State<MessDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mess Details', style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),));;
  }
}

