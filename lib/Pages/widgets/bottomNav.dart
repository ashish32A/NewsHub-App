import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshub/Controller/bottomNavController.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

bool homes = true, category = false, setting = false;

class _BottomnavState extends State<Bottomnav> {
  Bottomnavcontroller Controller = Get.put(Bottomnavcontroller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 60,
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  border: Border.all(color: Colors.blue, width: 1.2),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      homes = true;
                      category = false;
                      setting = false;
                      setState(() {});
                      Controller.index.value = 0;
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: homes ? Colors.blue[700] : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: homes ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homes = false;
                      category = true;
                      setting = false;
                      setState(() {});
                      Controller.index.value = 1;
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: category ? Colors.blue[700] : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.window,
                        size: 25,
                        color: category ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homes = false;
                      category = false;
                      setting = true;
                      setState(() {});
                      Controller.index.value = 2;
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: setting ? Colors.blue[700] : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.settings,
                        size: 25,
                        color: setting ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
