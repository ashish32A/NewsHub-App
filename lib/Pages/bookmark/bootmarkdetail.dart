import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshub/Pages/articleView.dart';

import '../../Controller/bookmarkController.dart';

class Bootmarkdetail extends StatefulWidget {
  final String newsTitle;
  final dynamic newsImageUrl;
  final dynamic author;
  final String newsUrl;
  final String newsId;
  final String publishedAt;
  final String description;
  const Bootmarkdetail(
      {super.key,
      required this.newsTitle,
      required this.newsImageUrl,
      required this.author,
      required this.newsUrl,
      required this.publishedAt,
      required this.description,
      required this.newsId});

  @override
  State<Bootmarkdetail> createState() => _BootmarkdetailState();
}

class _BootmarkdetailState extends State<Bootmarkdetail> {
  final BookmarkController bookmarkController = BookmarkController();
  @override
  Widget build(BuildContext context) {
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
                  InkWell(
                    onTap: () {
                      bookmarkController.removeBookmark(widget.newsId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Deleted Bookmarked")),
                      );
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        size: 25,
                      ),
                    ),
                  ),
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
                          widget.newsImageUrl ??
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
                widget.newsTitle,
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
                      widget.author != null && widget.author!.isNotEmpty
                          ? widget.author![0]
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
                      widget.author ?? "Unknown",
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
                widget.description,
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  navigator!
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return ArticleVeiw(blogUrl: widget.newsUrl!);
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
