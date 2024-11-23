import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshub/Controller/newsController.dart';
import 'package:newshub/Pages/newDetails/newsDetails.dart';
import 'package:newshub/Pages/widgets/bottomNav.dart';
import 'package:newshub/Pages/widgets/Newstile.dart';
import 'package:newshub/Pages/widgets/TrendingCard.dart';

class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("NEWS",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          Text("HUB",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      )),
      floatingActionButton: const Bottomnav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hottest News",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("See All", style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () {
                    if (newscontroller.isTrendingLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Row(
                      children: newscontroller.trendingNewsList.map((newsItem) {
                        return Trendingcard(
                          ontap: () {
                            if (newsItem != null) {
                              Get.to(() => Newsdetails(news: newsItem));
                            } else {
                              Get.snackbar(
                                  "Error", "News details are not available");
                            }
                          },
                          imageUrl: newsItem.urlToImage ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                          tag:
                              "Trending 1", // Assuming each news item has a unique ID
                          time: newsItem.publishedAt!,
                          title: newsItem.title!,
                          author: newsItem.author ?? "Unknown",
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("News for you",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("See All", style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
              const SizedBox(height: 10.0),
              Obx(() => Column(
                    children: newscontroller.newsForyouList.map((e) {
                      if (newscontroller.isNewsForyouLoading.value) {
                        return const CircularProgressIndicator();
                      }
                      if (newscontroller.trendingNewsList.isEmpty) {
                        return const Center(
                            child: Text("No trending news available."));
                      } else {
                        return Newstile(
                          ontap: () {
                            // ignore: unnecessary_null_comparison
                            if (e != null) {
                              Get.to(() => Newsdetails(news: e));
                            } else {
                              Get.snackbar(
                                  "Error", "News details are not available");
                            }
                          },
                          imageUrl: e.urlToImage ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                          time: e.publishedAt ?? "Unknown time",
                          title: e.title ?? "Untitled",
                          author: e.author ?? "Unknown",
                        );
                      }
                    }).toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
