import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Mess feedback',
          style: GoogleFonts.lato(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey[400],
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select your mess:',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 500.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mohini');
                },
                child: Text(
                  'Mohini',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 53, 51, 51)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 500.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jaiswalNew');
                },
                child: Text(
                  'Jaiswal (New)',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 53, 51, 51)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 500.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jaiswalOld');
                },
                child: Text(
                  'Jaiswal (Old)',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 53, 51, 51)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
