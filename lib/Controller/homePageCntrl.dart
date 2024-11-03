import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomNavController.dart';

class Homepagecntrl extends StatefulWidget {
  const Homepagecntrl({super.key});

  @override
  State<Homepagecntrl> createState() => _HomepagecntrlState();
}

class _HomepagecntrlState extends State<Homepagecntrl> {
   Bottomnavcontroller controllers = Get.put(Bottomnavcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controllers.pages[controllers.index.value]),
    );
  }
}