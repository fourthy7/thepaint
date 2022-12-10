import 'package:flutter/material.dart';
import 'package:ramene/view/login.dart';
import 'package:ramene/view/register.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 20.50, 0, 0)),
              Container(
                  child: Image.asset(
                'assets/images/logo2.png',
                height: 200,
              )),
              SizedBox(
                height: 12,
              ),
              Text(
                  "  A museum is a place where\n  one should lose one's head. ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                    child: Text(
                      "   Log in",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                    },
                    child: Text(
                      "   Sign up",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ), // Stack(
              //   children: <Widget>[
              //     Positioned(bottom: 0, right: 0,
              //     child: Image.asset('assets/camera.png'),)
              //   ],
              // ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(),
                    child: (Image.asset(
                      'assets/images/lastsu.jpg',
                      height: 300,
                    )),
                  ))

              // Align(alignment: Alignment.centerLeft,
              // child: Column(children: <Widget>[
              //   Text("data")
              // ]),)
              // Align(alignment: Alignment.centerLeft,
              // child: Column(children: <Widget>[ Text("Whether you sell or buy,\n the auction is all yours", style: GoogleFonts.poppins(fontSize: 22))]),)
            ],
          ),
        ),
      ),
    );
  }
}
