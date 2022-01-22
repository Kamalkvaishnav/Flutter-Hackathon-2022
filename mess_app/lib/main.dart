import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mess_app/dashboard.dart';

import 'package:mess_app/messPortal.dart';
import 'package:mess_app/preBooking.dart';
import 'package:mess_app/traffic.dart';

import 'package:mess_app/api/googleSheetsApi.dart';
import 'package:mess_app/trytraffic.dart';
import 'package:mess_app/upi.dart';

import 'feedback.dart';

Future<void> main() async {
  googleSheetsAPI.init();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Dashboard(),
      '/messportal': (context) => const MessPortal(),
      '/traffic': (context) => const TrafficUI(),
      '/feedback': (context) => const FormMohini(),
      // '/mohini': (context) => const FormMohini(),
      // '/jaiswalNew': (context) => const FormJaiwalNew(),
      // '/jaiswalOld': (context) => const FormJaiswalOld(),
      '/upi': ((context) => const UpiPayment()),
      '/prebooking': ((context) => const PreBooking()),
    },
  ));
}
