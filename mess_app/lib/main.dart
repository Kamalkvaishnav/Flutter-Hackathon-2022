import 'package:flutter/material.dart';
import 'package:mess_app/dashboard.dart';
import 'package:mess_app/formJaiswalNew.dart';
import 'package:mess_app/formJaiswalOld.dart';
import 'package:mess_app/formMohini.dart';
import 'package:mess_app/messPortal.dart';
import 'package:mess_app/traffic.dart';
import 'package:mess_app/feedbackform.dart';
import 'package:mess_app/dashboard.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Dashboard(),
      '/messportal': (context) => const MessPortal(),
      '/traffic': (context) => const Traffic(),
      '/feedback': (context) => const FeedbackForm(),
      '/mohini': (context) => const FormMohini(),
      '/jaiswalNew': (context) => const FormJaiswalNew(),
      '/jaiswalOld': (context) => const FormJaiswalOld(),
    },
  ));
}
