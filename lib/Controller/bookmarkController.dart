import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class BookmarkController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
 

  /// Add a news item to the user's bookmarks
  Future<void> addBookmark({
    required String newsId,
    required String title,
    required dynamic imageUrl,
    required dynamic author,
    required String newsUrl,
    required String publishedAt,
    required String description,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not authenticated');
    }

    final bookmarkRef = _firestore
        .collection('bookmarks')
        .doc(user.uid)
        .collection('userBookmarks')
        .doc(newsId);

    await bookmarkRef.set({
      'newsId': newsId,
      'title': title,
      'imageUrl': imageUrl,
      'newsUrl': newsUrl,
      'author': author,
      'publishedAt': publishedAt,
      'description': description,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  /// Remove a news item from the user's bookmarks
  Future<void> removeBookmark(String newsId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not authenticated');
    }

    final bookmarkRef = _firestore
        .collection('bookmarks')
        .doc(user.uid)
        .collection('userBookmarks')
        .doc(newsId);

    await bookmarkRef.delete();
  }

  /// Check if a news item is already bookmarked
  Future<bool> isBookmarked(String newsId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not authenticated');
    }

    final doc = await _firestore
        .collection('bookmarks')
        .doc(user.uid)
        .collection('userBookmarks')
        .doc(newsId)
        .get();

    return doc.exists;
  }
 

  /// Get the user's bookmarks
  Stream<List<Map<String, dynamic>>> getUserBookmarks() {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not authenticated');
    }

    return _firestore
        .collection('bookmarks')
        .doc(user.uid)
        .collection('userBookmarks')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
