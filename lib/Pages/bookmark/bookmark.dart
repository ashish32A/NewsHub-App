import 'package:flutter/material.dart';

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

          return ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final bookmark = bookmarks[index];
              return ListTile(
                leading: bookmark['imageUrl'] != null
                    ? Image.network(bookmark['imageUrl'],
                        width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(Icons.image_not_supported),
                title: Text(bookmark['title']),
                subtitle: Text(bookmark['description']),
                onTap: () {
                  // Open news URL in a browser
                  final url = bookmark['newsUrl'];
                  // Use URL launcher or any other navigation logic
                },
              );
            },
          );
        },
      ),
    );
  }
}
