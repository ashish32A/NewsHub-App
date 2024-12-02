import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void submitContact(BuildContext context) async {
    String name = nameController.text;
    String email = emailController.text;
    String message = messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required.")),
      );
      return;
    }

    await FirebaseFirestore.instance.collection('contactUs').add({
      'name': name,
      'email': email,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
    // Logic to send feedback (e.g., Firebase or email service)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Thank you for your Contact, $name!")),
    );

    // Clear the fields
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Contact Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "We'd love to hear from you!",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      labelText: "Your Message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => submitContact(context),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
