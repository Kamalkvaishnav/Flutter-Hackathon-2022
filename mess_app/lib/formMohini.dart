import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FormMohini extends StatefulWidget {
  const FormMohini({Key? key}) : super(key: key);

  @override
  State<FormMohini> createState() => _FormMohiniState();
}

class _FormMohiniState extends State<FormMohini> {
  final formKey = GlobalKey<FormState>();

  String favDish = '';
  String hygiene = '';
  String messStaff = '';
  String foodrating = '';
  String other = '';

  Widget _buildFavDish() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Please enter text';
        }
        return null;
      }),
      onSaved: (value) => setState(() => favDish = value!),
    );
  }

  Widget _buildFoodRating() {
    return SmoothStarRating(
        starCount: 5,
        isReadOnly: false,
        size: 40,
        color: Colors.yellowAccent,
        borderColor: Colors.grey,
        onRated: (value) => setState(() => foodrating = value as String));
  }

  Widget _buildHygiene() {
    return SmoothStarRating(
      starCount: 5,
      isReadOnly: false,
      size: 40,
      color: Colors.yellowAccent,
      borderColor: Colors.grey,
      onRated: (value) => setState(() => hygiene = value as String),
    );
  }

  Widget _buildMessStaff() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Please enter text';
        }
        return null;
      }),
      onSaved: (value) => setState(() => messStaff = value!),
    );
  }

  Widget _buildOther() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return 'Please enter text';
        }
        return null;
      }),
      onSaved: (value) => setState(() => other = value!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
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
        body: Form(
            child: Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'What is your current favourite dish in the mess?',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    _buildFavDish(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'How is the food in your mess?',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    _buildFoodRating(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'How hygenic is your ness?',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    _buildHygiene(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'How is the behaviour of the mess staff?',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    _buildMessStaff(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Any other suggestions',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    _buildOther(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/feedback');
                      },
                      child: Text(
                        'Submit',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 53, 51, 51)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                      ),
                    ),
                  ],
                ))));
  }
}
