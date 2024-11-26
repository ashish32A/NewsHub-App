import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newshub/Pages/LoginScreen.dart';
import 'package:newshub/Pages/passForgot.dart';
import '../Controller/SignUp_Controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userform = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController nameInput = TextEditingController();
  TextEditingController mobileNoInput = TextEditingController();
  bool isloading = false;
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      const SizedBox(height: 90),
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/Images/newshub.jpg")),
                      const SizedBox(height: 50),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is Required ";
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text("Name"),
                            prefixIcon: Icon(Icons.person_outline_rounded)),
                      ),
                      const SizedBox(height: 20),
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
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is Required ";
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
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
                                    await SignupController.createAccount(
                                        context: context,
                                        email: emailInput.text,
                                        password: passwordInput.text,
                                        name: nameInput.text);
                                    isloading = false;
                                    setState(() {});
                                  }
                                },
                                child: isloading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "Signup",
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
                          const Text("Already have an account?"),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                            },
                            child: const Text(
                              "Login Here",
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
