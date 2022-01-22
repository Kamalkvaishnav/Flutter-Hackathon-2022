import 'dart:convert';
import 'package:mess_app/models/bookingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/utilities/gsheets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/studentProfile.dart';
import 'api/googleSheetsApi.dart';

class PreBooking extends StatefulWidget {
  const PreBooking({Key? key}) : super(key: key);

  @override
  _PreBookingState createState() => _PreBookingState();
}

class _PreBookingState extends State<PreBooking> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut() {
    var options = {
      'key': 'rzp_test_BvGPqKnK72wuDO',
      'amount': 60 * 100,
      'name': 'Messify',
      'description': 'Payment for Non-Veg food',
      'prefill': {'contact': '8824021945', 'email': 'ravi@iitgn.ac.in'},
      'external': {
        'wallet': ['Paytm']
      },
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse) {
    print('Payment Success');
    sendEmail(
        name: 'Sandeep Desai',
        email: 'desai.sandeep@iitgn.ac.in',
        subject: 'Mess Order Confirmed!!',
        messaage: 'We recieved your order successfully!!');
    final booking_row = {
      bookFeilds.Name: "Kamal",
      bookFeilds.emailid: "kamal@iitgn.ac.in",
      bookFeilds.time: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString()
    };
    googleSheetsAPI.addToSheets([booking_row]);
    Toast.show('Payment Success', context, duration: Toast.LENGTH_LONG);
    Navigator.pushNamed(context, '/prebooking');
  }

  void handlerErrorFailure(PaymentFailureResponse) {
    print('Payment Failed');
    Toast.show('Payment Failed', context, duration: Toast.LENGTH_LONG);
    Navigator.pushNamed(context, '/prebooking');
  }

  void handlerExternalWallet(ExternalWalletResponse) {
    print('External Wallet');
    Toast.show('External wallet', context, duration: Toast.LENGTH_LONG);
    Navigator.pushNamed(context, '/prebooking');
  }

  //Email
  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String messaage,
  }) async {
    final serviceId = 'service_tzgouv6';
    final templateId = 'template_trfpnk8';
    final userId = 'user_ctINjWbncDnk1HXWOcnbJ';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': messaage
          }
        }));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              image: DecorationImage(
                image: AssetImage("assets/biryani.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,

                //color: Colors.white,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0),
                  ),
                ),

                child: Column(
                  children: [
                    SizedBox(height: 25),
                    //
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chicken Biryani",
                            style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "@120   ",
                            style: GoogleFonts.lato(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 70, 70),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Payment Method",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      //color: Colors.yellow,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 1.0,
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            primary: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/newUPI.png"),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/upi');
                          sendEmail(
                              name: 'Sandeep Desai',
                              email: 'desai.sandeep@iitgn.ac.in',
                              subject: 'Mess Order Confirmed!!',
                              messaage:
                                  'We recieved your order successfully!!');
                          final booking_row = {
                            bookFeilds.Name: "Kamal",
                            bookFeilds.emailid: "kamal@iitgn.ac.in",
                            bookFeilds.time: DateTime.now().hour.toString() +
                                ":" +
                                DateTime.now().minute.toString()
                          };
                          googleSheetsAPI.addToSheets([booking_row]);
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      //color: Colors.yellow,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 1.0,
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            primary: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/razor.png",
                            ),
                          ],
                        ),
                        onPressed: openCheckOut,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
