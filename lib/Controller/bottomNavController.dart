import 'package:get/get.dart';
import 'package:newshub/Pages/Categories.dart';
import 'package:newshub/Pages/HomePages.dart';
import 'package:newshub/Pages/setting.dart';

class Bottomnavcontroller extends GetxController {
  RxInt index = 0.obs;
  var pages = [const Homepages(), const Categories(), const setting()];
}
