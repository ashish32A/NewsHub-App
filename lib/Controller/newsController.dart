import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newshub/Model/newsModel.dart';

class Newscontroller extends GetxController {
  RxList<Newsmodel> trendingNewsList = <Newsmodel>[].obs;
  RxList<Newsmodel> newsForyouList = <Newsmodel>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForyouLoading = false.obs;

  void onInit() async {
    super.onInit();
    getNewsForyou();
    getTrendingNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=77e1dcb3c1d04dc8b607128688e697a2";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var articals = body["articles"];
        for (var news in articals) {
          trendingNewsList.add(Newsmodel.fromJson(news));
        }
      } else {
        print("Something went wrong in Trending News");
      }
      print(trendingNewsList);
    } catch (ex) {
      print(ex);
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForyou() async {
    isNewsForyouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2025-01-17&to=2025-01-17&sortBy=popularity&apiKey=77e1dcb3c1d04dc8b607128688e697a2";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var articals = body["articles"];
        for (var news in articals) {
          newsForyouList.add(Newsmodel.fromJson(news));
        }
      } else {
        print("Something went wrong in NewsForyou News");
      }
      print(newsForyouList);
    } catch (ex) {
      print(ex);
    }
    isNewsForyouLoading.value = false;
  }
}
