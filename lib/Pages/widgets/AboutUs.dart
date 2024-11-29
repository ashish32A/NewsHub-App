import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'About Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 20),
          Text(
            "Welcome to NewsHub!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "NewsHub is your one-stop destination for staying updated with the latest news from around the world. "
            "We are committed to delivering accurate, unbiased, and timely news to keep you informed.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Our Mission",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "At NewsHub, our mission is to provide reliable news coverage and empower individuals with knowledge to make informed decisions.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Our Vision",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "To be the most trusted and respected news platform globally, fostering transparency, credibility, and inclusivity in journalism.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "If you have any questions or feedback, feel free to reach out to us at:",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.email, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "support@newshub.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "+1 123 456 7890",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Thank you for choosing NewsHub!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
