import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ArticleVeiw extends StatefulWidget {
  String blogUrl;
  ArticleVeiw({super.key, required this.blogUrl});

  @override
  State<ArticleVeiw> createState() => _ArticleVeiwState();
}

class _ArticleVeiwState extends State<ArticleVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NEWS",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 11, 11),
                    fontWeight: FontWeight.bold)),
            Text(
              "HUB",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
