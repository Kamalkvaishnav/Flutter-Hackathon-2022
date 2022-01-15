import 'package:flutter/material.dart';
import 'package:mess_app/dashboard.dart';
import 'package:mess_app/messPortal.dart';
import 'package:mess_app/traffic.dart';
import 'package:mess_app/feedbackform.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Dashboard(),
      '/messportal': (context) => const MessPortal(),
      '/traffic': (context) => const Traffic(),
      '/feedback': (context) => const FeedbackForm(),
    },
  ));
}
