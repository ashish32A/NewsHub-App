import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newshub/Controller/homePageCntrl.dart';
import '../Controller/Login_Controller.dart';
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
                        },
                        decoration: const InputDecoration(label: Text("Email")),
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
                        obscureText: true,
                        decoration:
                            const InputDecoration(label: Text("Password")),
                      ),
                      const SizedBox(height: 30),
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
                                    // await LoginController.Login(
                                    //     context: context,
                                    //     email: emailInput.text,
                                    //     password: passwordInput.text);
                                    // isloading = false;
                                    // setState(() {});
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const Homepagecntrl();
                                    }));
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
