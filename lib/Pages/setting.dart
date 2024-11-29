import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newshub/Pages/LoginScreen.dart';
import 'package:newshub/Pages/Profile.dart';
import 'package:newshub/Pages/widgets/PrivacyPolicy.dart';
import 'package:newshub/Pages/widgets/bottomNav.dart';

import 'bookmark/bookmark.dart';
import 'widgets/AboutUs.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SETTING",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    // List Items
                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue),
                                child: const Icon(Icons.person_rounded,
                                    color: Colors.white)),
                            title: const Text('Profile'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalBookmarks()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blueGrey),
                                child: const Icon(Icons.bookmark_border_rounded,
                                    color: Colors.white)),
                            title: const Text('Bookmark'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    height: 500,
                                    padding: const EdgeInsets.all(10),
                                    child: const Column(
                                      children: [
                                        Center(
                                            child: Text(
                                          'Contact Us',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue),
                                child: const Icon(
                                  Icons.contacts,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            title: const Text('Contact Us'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PrivacyPolicyPage();
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red),
                                child: const Icon(Icons.lock_outline_rounded,
                                    color: Colors.white)),
                            title: const Text(
                              'Privacy Policy',
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return AboutUsPage();
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.teal),
                                child: const Icon(Icons.info,
                                    color: Colors.white)),
                            title: const Text('About Us'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.only(top: 50.0, bottom: 80),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 40.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Center(
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }), (route) {
                                  return false;
                                });
                              },
                              child: const Text("Logout",
                                  style: TextStyle(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins'))),
                        ),
                      ),
                    ),
                  ))
            ],
          )),
        ),
      ),
      floatingActionButton: const Bottomnav(),
    );
  }
}
