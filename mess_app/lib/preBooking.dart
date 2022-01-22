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
    return Scaffold(
      // appBar: AppBar(

      //   title: const Text('   Mess Portal'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.add_alert),
      //       tooltip: 'Show Snackbar',
      //       onPressed: () {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('This is a snackbar')));
      //       },
      //     ),
      //   ],
      // ),

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
                  // boxShadow: [
                  //   BoxShadow(
                  //     color : Colors.blue,
                  //     blurRadius: 6,
                  //     spreadRadius: 3,
                  //   ),
                  // ],
                ),

                child: Column(
                  children: [
                    SizedBox(height: 25),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Non-veg Menu",
                    //       style: GoogleFonts.lato(
                    //         fontSize: 28,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.lightBlue,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
