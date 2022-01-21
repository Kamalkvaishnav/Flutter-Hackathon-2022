import 'package:flutter/material.dart';
import 'package:mess_app/dashboard.dart';

class FirstLoading extends StatefulWidget {
  const FirstLoading({Key? key}) : super(key: key);

  @override
  _FirstLoadingState createState() => _FirstLoadingState();
}

class _FirstLoadingState extends State<FirstLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//         onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) {
//       return Profile();
//     }),
//   );
// }
//         ),

      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/cutlery.png"),
                      radius: 60,
                    ),
                    SizedBox(height: 00),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
