import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:mess_app/models/feedformModel.dart';
import 'package:mess_app/api/googleSheetsApi.dart';

class FormMohini extends StatefulWidget {
  const FormMohini({Key? key}) : super(key: key);

  @override
  State<FormMohini> createState() => _FormMohiniState();
}

class _FormMohiniState extends State<FormMohini> {
  final formKey = GlobalKey<FormState>();

  String favDish = '';
  String other = '';

  String messStaff = '';
  late double foodrating = 0;
  late double hygiene = 0;

  Widget _buildFavDish() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Favourite Food',
        filled: true,
        fillColor: Color.fromARGB(255, 238, 238, 238),
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 40, 158, 255)),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.w400),
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
        color: Color.fromARGB(255, 40, 158, 255),
        borderColor: Color.fromARGB(255, 93, 94, 94),
        onRated: (value) => setState(() => foodrating = value as double));
  }

  Widget _buildHygiene() {
    return SmoothStarRating(
      starCount: 5,
      isReadOnly: false,
      size: 40,
      color: Color.fromARGB(255, 40, 158, 255),
      borderColor: Color.fromARGB(255, 94, 93, 93),
      onRated: (value) => setState(() => hygiene = value as double),
    );
  }

  Widget _buildMessStaff() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Mess Staff',
        filled: true,
        fillColor: Color.fromARGB(255, 238, 238, 238),
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 40, 158, 255)),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.w400),
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
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Other',
        filled: true,
        fillColor: Color.fromARGB(255, 238, 238, 238),
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 40, 158, 255)),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 161, 161, 161)),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.w400),
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            'Mess Feedback',
            style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 226, 226, 226),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/Appbar.png'))),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 10),
                  child: Column(
                    children: [
                      Text(
                        'Feedback',
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 40, 158, 255),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'How hygenic is your mess?',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildHygiene(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'How is the food in your mess?',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildFoodRating(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'What is your current favourite dish in the mess?',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildFavDish(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'How is the behaviour of the mess staff?',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildOther(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {

                            formKey.currentState?.save();

                            final feedback_row = {
                              feedbackFeilds.favDish: favDish,
                              feedbackFeilds.foodrating: foodrating,
                              feedbackFeilds.hygeine: hygiene,
                              feedbackFeilds.messStaff: messStaff,
                              feedbackFeilds.other: other
                            };
                            googleSheetsAPI.insert([feedback_row]);
                            Navigator.pushNamed(context, '/');
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
                                const Color.fromARGB(255, 40, 158, 255)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
