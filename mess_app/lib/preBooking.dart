import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 125, 255, 120),
        height: 300,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Chiken Biryani',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 3, 3, 3),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: openCheckOut, child: Text("Pay With RazorPay")),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upi');
                },
                child: Text("Pay With UPI"))
          ],
        ),
      ),
    );
  }
}
