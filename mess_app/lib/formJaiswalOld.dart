import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:mess_app/api/googleSheetsApi.dart';
import 'package:mess_app/models/feedformModel.dart';
class FormJaiswalOld extends StatefulWidget {
  const FormJaiswalOld({Key? key}) : super(key: key);

  @override
  State<FormJaiswalOld> createState() => _FormJaiswalOldState();
}

class _FormJaiswalOldState extends State<FormJaiswalOld> {
  final formKey = GlobalKey<FormState>();

  String favDish = '';
  String other = '';

  String messStaff = '';
  late double foodrating;
  late double hygiene;

  Widget _buildFavDish() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 20),
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Please enter text';
        }
        return null;
      }),
      onSaved: (value) => setState(() => favDish = value!.toString()),
    );
  }

  Widget _buildFoodRating() {
    return SmoothStarRating(
        starCount: 5,
        isReadOnly: false,
        size: 40,
        color: Colors.yellowAccent,
        borderColor: Colors.grey,
        onRated: (value) => setState(() => foodrating = value));

  }

  Widget _buildHygiene() {
    return SmoothStarRating(
      starCount: 5,
      isReadOnly: false,
      size: 40,
      color: Colors.yellowAccent,
      borderColor: Colors.grey,
      onRated: (value) => setState(() => hygiene = value),

     
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
      onSaved: (value) => setState(() => messStaff = value!.toString()),
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
      onSaved: (value) => setState(() => other = value!.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
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
        body: Form(
           key:formKey,
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
                        formKey.currentState?.save();
                        Navigator.pushNamed(context, '/feedback');
                        
                        final feedback_row={
                          feedbackFeilds.favDish:favDish,
                          feedbackFeilds.foodrating:foodrating,
                          feedbackFeilds.hygeine:hygiene,
                          feedbackFeilds.messStaff:messStaff,
                          feedbackFeilds.other:other

                        };
                        googleSheetsAPI.insert([feedback_row]);
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
