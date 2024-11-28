import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshub/Model/newsModel.dart';
import 'package:newshub/Pages/articleView.dart';
import 'package:newshub/Pages/bookmarkButton.dart';

class Newsdetails extends StatefulWidget {
  final Newsmodel news;
  const Newsdetails({super.key, required this.news});

  @override
  State<Newsdetails> createState() => _NewsdetailsState();
}

class _NewsdetailsState extends State<Newsdetails> {
  int randomNumber = 100000 + Random().nextInt(900000);

  @override
  Widget build(BuildContext context) {
    // Check if news is null or any key is missing
    // ignore: unnecessary_null_comparison
    if (widget.news == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("News details are not available")),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  BookmarkButton(
                    newsId: randomNumber.toString(),
                    newsTitle: widget.news.title!,
                    newsImageUrl: widget.news.urlToImage,
                    newsUrl: widget.news.url!,
                    publishedAt: widget.news.publishedAt!,
                    description: widget.news.description!,
                    author: widget.news.author,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.news.urlToImage ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.news.title!,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue[700],
                    child: Text(
                      widget.news.author != null &&
                              widget.news.author!.isNotEmpty
                          ? widget.news.author![0]
                          : '?',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      widget.news.author ?? "Unknown",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                widget.news.description ?? "no desciption",
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  navigator!
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return ArticleVeiw(blogUrl: widget.news.url!);
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Text color
                ),
                child: const Text('See More'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
