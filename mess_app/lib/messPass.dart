import 'package:flutter/material.dart';
import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/api/googleSheetsApi.dart';
// import 'package:mess_app/api/googleSheetsApi.dart';
// import 'package:flutter/rendering.dart';
// import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MessPass extends StatefulWidget {
  const MessPass({Key? key}) : super(key: key);

  @override
  _MessPassState createState() => _MessPassState();
}

String qr = 'helloWorld';
Future _scanQR(BuildContext context) async {
  try {
    var qrResult = await BarcodeScanner.scan();
    qr = qrResult.rawContent;
    googleSheetsAPI.updateCell(qr);
  } catch (e) {
    print(e);
  }
}

Future<QrImage> _getQR() async {
  if (qr == null) {
    return QrImage(
      data: await googleSheetsAPI.getQRCode(),
      size: 200.0,
    );
  } else {
    return QrImage(
      data: await googleSheetsAPI.getQRCode(),
      size: 200.0,
    );
  }
}

class _MessPassState extends State<MessPass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.82,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Mess QR Code',
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 70, 70, 70),
                              fontSize: 27,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(
                          -4.0,
                          4.0,
                        ),
                        blurRadius: 4.0),
                    BoxShadow(color: Colors.white)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FutureBuilder(
                    future: _getQR(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Text('Snapshot.data is null');
                      } else {
                        return snapshot.data;
                      }
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton.extended(
            onPressed: () => _scanQR(context),
            icon: Icon(Icons.qr_code),
            label: Text("Scan"));
      }),
    );
  }
}
