import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is Required ";
                          }
                        },
                        decoration: const InputDecoration(label: Text("Name")),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: mobileNoInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Country is Required ";
                          }
                        },
                        decoration:
                            const InputDecoration(label: Text("Country")),
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
                                    await SignupController.createAccount(
                                        context: context,
                                        email: emailInput.text,
                                        password: passwordInput.text,
                                        name: nameInput.text,
                                        number: int.parse(mobileNoInput.text));
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
