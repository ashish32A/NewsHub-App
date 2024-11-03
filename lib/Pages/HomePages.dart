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
                    () => newscontroller.isTrendingLoading.value
                        ? const CircularProgressIndicator()
                        : Row(
                            children: newscontroller.trendingNewsList
                                .map(
                                  (e) => Trendingcard(
                                      ontap: () {
                                        Get.to(Newsdetails(
                                          news: e,
                                        ));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                                      tag: "Trending 1",
                                      time: e.publishedAt!,
                                      title: e.title!,
                                      author: e.author ?? "UnKnown"),
                                )
                                .toList()),
                  )),
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
                      } else {
                        return Newstile(
                          ontap: () {
                            Get.to(() => Newsdetails(news: e));
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
