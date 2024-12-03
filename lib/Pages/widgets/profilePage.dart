import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User? user;
  Map<String, dynamic> userProfile = {};

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user!.uid).get();
      setState(() {
        userProfile = doc.data() ?? {};
      });
    }
  }

  void _editProfile() async {
    final TextEditingController nameController =
        TextEditingController(text: userProfile['name']);
    final TextEditingController countryController =
        TextEditingController(text: userProfile['country']);
    final TextEditingController dobController =
        TextEditingController(text: userProfile['dob']);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(labelText: "Country"),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "Date of Birth (YYYY-MM-DD)",
                ),
                onTap: () async {
                  FocusScope.of(context)
                      .requestFocus(FocusNode()); // Hide keyboard
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(userProfile['dob']),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    dobController.text =
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _firestore.collection('users').doc(user!.uid).update({
                  'name': nameController.text,
                  'country': countryController.text,
                  'dob': dobController.text,
                });
                setState(() {
                  userProfile['name'] = nameController.text;
                  userProfile['country'] = countryController.text;
                  userProfile['dob'] = dobController.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile Updated")),
                );
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: userProfile.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          padding: const EdgeInsets.all(19),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Name: ${userProfile['name'] ?? 'N/A'}",
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(height: 15),
                    Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Country: ${userProfile['country'] ?? 'N/A'}",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                    const SizedBox(height: 15),
                    Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "DOB: ${userProfile['dob'] ?? 'N/A'}",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                    const SizedBox(height: 15),
                    Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Email: ${user?.email ?? 'N/A'}",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: _editProfile,
                          // ignore: sort_child_properties_last
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
