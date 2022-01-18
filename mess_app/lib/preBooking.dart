import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreBooking extends StatelessWidget {
  const PreBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text("Pre-Booking Page",
                style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 148, 147, 147),
                    fontSize: 30,
                    fontWeight: FontWeight.w700))));
  }
}
