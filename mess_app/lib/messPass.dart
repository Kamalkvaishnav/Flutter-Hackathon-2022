import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/utilities/gsheets.dart';

class MessPass extends StatefulWidget {
  const MessPass({Key? key}) : super(key: key);

  @override
  _MessPassState createState() => _MessPassState();
}

class _MessPassState extends State<MessPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'Mess QR Code',
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
            height: 10,
          ),
          Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[400]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: NetworkImage(
                    'https://pngimg.com/uploads/qr_code/qr_code_PNG9.png'),
              ),
            ),
          ),
          SizedBox(
            height: 30,
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
                      'Pass_ID: 2103XY3',
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
