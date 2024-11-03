import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshub/Model/newsModel.dart';
import 'package:newshub/Pages/articleView.dart';

class Newsdetails extends StatefulWidget {
  final Newsmodel news;
  const Newsdetails({super.key, required this.news});

  @override
  State<Newsdetails> createState() => _NewsdetailsState();
}

class _NewsdetailsState extends State<Newsdetails> {
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
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text('Back'),
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
                          widget.news.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
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
                      widget.news.author[0]!,
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
                widget.news.description!,
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  navigator!.push(MaterialPageRoute(builder: (context) {
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
