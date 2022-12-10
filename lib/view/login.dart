import 'package:ramene/myhomepage.dart';
import 'package:ramene/view/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramene/onboarding_page.dart';
// import 'package:ramene/constants.dart';
// import 'package:ramene/shared_pref.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
    try {
      // ME-GET atau Mengambil data json dari link
      var response = await Dio().get('http://localhost:3000/user');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan,
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
            break;
          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login Gagal',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Login Gagal',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // ThemeData themeData = ThemeData.light();

  // void setTheme(bool isDarkmode) {
  //   setState(() {
  //     themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
  //     SharedPref.pref?.setBool('isDarkmode', isDarkmode);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            Image.asset(
              '../assets/images/logo.png',
              height: 200,
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    "Hello Art Lovers",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text("Login to your account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      )),
                ],
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: controllerEmail,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email Address",
                hintText: "Email Address",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: controllerPass,
              obscureText: true,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Password",
                hintText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: Color.fromARGB(255, 43, 92, 164),
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                login(controllerEmail.text, controllerPass.text);
              },
              child: Text("LOGIN",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 43, 92, 164),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.grey,
                    )),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
                  },
                  child: Text("Sign up",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: Color.fromARGB(255, 43, 92, 164),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
