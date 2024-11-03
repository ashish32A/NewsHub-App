import 'package:flutter/material.dart';
import 'package:newshub/Pages/widgets/bottomNav.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: const Bottomnav(),
    );
  }
}
