import 'package:flutter/material.dart';
import 'package:newshub/Pages/bookmark/bookmarkTile.dart';
import 'package:newshub/Pages/bookmark/bootmarkdetail.dart';

import '../../Controller/bookmarkController.dart';

class PersonalBookmarks extends StatelessWidget {
  final BookmarkController _bookmarkController = BookmarkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a Scaffold here
      appBar: AppBar(
        title: Text('My Bookmarks'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _bookmarkController.getUserBookmarks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading bookmarks'));
          }

          final bookmarks = snapshot.data ?? [];

          if (bookmarks.isEmpty) {
            return Center(child: Text('No bookmarks yet.'));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];
                return Bookmarktile(
                  imageUrl: bookmark['imageUrl'] ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                  time: bookmark['publishedAt'] ?? '',
                  title: bookmark['title'] ?? 'unknown',
                  author: bookmark['author'] ?? 'unknown',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bootmarkdetail(
                          newsTitle: bookmark['title'] ?? "unknown",
                          newsUrl: bookmark["newsUrl"] ?? "",
                          publishedAt: bookmark['publishedAt'] ?? "unknown",
                          description:
                              bookmark["description"] ?? "No description",
                          newsImageUrl: bookmark['imageUrl'] ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQsq1NacYKHKS-RudSBgbLZa_ndkD-lmmQfA&s",
                          author: bookmark['author'] ?? "unknown",
                          newsId: bookmark['newsId'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
