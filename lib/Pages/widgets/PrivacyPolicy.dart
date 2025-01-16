import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Last Updated: [16-01-25]",
                style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16.0),
              Text(
                "Introduction",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "Welcome to NewsHub! Your privacy is important to us. This Privacy Policy explains how we collect, use, and safeguard your information when you use our app.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Information We Collect",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "1. Personal Information: When you create an account, we may collect your name, email address, and other contact details.\n"
                "2. Usage Data: We may collect information about how you use the app, including the pages you view and interactions you make.\n"
                "3. Device Information: Details about the device you use to access NewsHub, such as the model, operating system, and unique identifiers.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "How We Use Your Information",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "We use the information we collect to:\n"
                "- Provide and maintain our services.\n"
                "- Customize the content and user experience.\n"
                "- Communicate updates, offers, and news.\n"
                "- Ensure security and prevent fraud.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Sharing Your Information",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "We do not sell your personal data. We may share your information with third-party service providers only to support app functionality and improve user experience. These providers are bound to confidentiality agreements.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Your Rights",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "You have the right to:\n"
                "- Access the information we hold about you.\n"
                "- Request corrections or updates to your information.\n"
                "- Request deletion of your personal data.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Changes to This Policy",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "We may update this Privacy Policy from time to time. Any changes will be reflected on this page, so we encourage you to review it periodically.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Contact Us",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                "If you have any questions or concerns about this Privacy Policy, feel free to contact us at support@newshub.com.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Thank you for using NewsHub!",
                style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ));
  }
}
