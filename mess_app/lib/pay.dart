import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  static const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '60',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(height: 15),
          GooglePayButton(
            width: 150,
            height: 50,
            paymentConfigurationAsset: 'assets/gpay.json',
            paymentItems: _paymentItems,
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
