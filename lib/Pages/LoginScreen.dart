import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newshub/Controller/Login_Controller.dart';
import 'package:newshub/Controller/homePageCntrl.dart';
import 'package:newshub/Pages/passForgot.dart';
import 'package:provider/provider.dart';
import '../Providers/UseProvider.dart';
import 'SigupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userform = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  bool isloading = false;
  bool obsecureText = true;
  var user = FirebaseAuth.instance.currentUser;

  @override
  // void initState() {
  //   //check  user login status
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (user == null) {
  //       openLogin();
  //     } else {
  //       openDashboard();
  //     }
  //   });

  //   super.initState();
  // }

  // void openDashboard() {
  //   Provider.of<Userprovider>(context, listen: false).getUserDetails();
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const Homepagecntrl();
  //   }));
  // }

  // void openLogin() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const LoginScreen();
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userform,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 180),
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/Images/newshub.jpg")),
                      const SizedBox(height: 60),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is Required ";
                          }
                          final emailRegex =
                              RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: const Icon(Icons.email_outlined)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is Required ";
                          }
                        },
                        obscureText: obsecureText,
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          prefixIcon: const Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(obsecureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obsecureText = !obsecureText;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Passwordforgot()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          child: const Text(
                            "Forgot Password?",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 55),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () async {
                                  if (userform.currentState!.validate()) {
                                    isloading = true;
                                    setState(() {});
                                    await LoginController.Login(
                                        context: context,
                                        email: emailInput.text,
                                        password: passwordInput.text);
                                    isloading = false;
                                    setState(() {});
                                  }
                                },
                                child: isloading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignupScreen();
                              }));
                            },
                            child: const Text(
                              "SignUp Here",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
