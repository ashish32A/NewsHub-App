import 'package:flutter/material.dart';
import '../../Controller/bookmarkController.dart';

class BookmarkButton extends StatefulWidget {
  final String newsId;
  final String newsTitle;
  final dynamic newsImageUrl;
  final dynamic author;
  final String newsUrl;
  final String publishedAt;
  final String description;

  BookmarkButton({
    required this.newsId,
    required this.newsTitle,
    required this.newsImageUrl,
    required this.newsUrl,
    required this.publishedAt,
    required this.description, this.author,
  });

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  final BookmarkController _bookmarkController = BookmarkController();
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _checkBookmarkStatus();
  }

  Future<void> _checkBookmarkStatus() async {
    try {
      final status = await _bookmarkController.isBookmarked(widget.newsId);
      setState(() {
        isBookmarked = status;
      });
    } catch (e) {
      print(e); // Handle errors
    }
  }

  Future<void> _toggleBookmark() async {
    try {
      if (isBookmarked) {
        await _bookmarkController.removeBookmark(widget.newsId);
      } else {
        await _bookmarkController.addBookmark(
          newsId: widget.newsId,
          title: widget.newsTitle,
          imageUrl: widget.newsImageUrl,
          newsUrl: widget.newsUrl,
          publishedAt: widget.publishedAt,
          description: widget.description, author: widget.author,
        );
      }
      setState(() {
        isBookmarked = !isBookmarked;
      });
    } catch (e) {
      print(e); // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Colors.blue : Colors.grey,size: 28,
      ),
      onPressed: _toggleBookmark,
    );
  }
}
