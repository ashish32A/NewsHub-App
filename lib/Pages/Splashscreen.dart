import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newshub/Controller/homePageCntrl.dart';
import 'package:newshub/Pages/LoginScreen.dart';
import 'package:provider/provider.dart';

import '../Providers/UseProvider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    //check  user login status

    Future.delayed(const Duration(seconds: 3), () {
      if (user == null) {
        openLogin();
      } else {
        openDashboard();
      }
    });

    super.initState();
  }

  void openDashboard() {
    Provider.of<Userprovider>(context, listen: false).getUserDetails();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const Homepagecntrl();
    }));
  }

  void openLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Center(
                child: Image.asset(
                  "assets/Images/newssplash.jpg",
                  height: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
