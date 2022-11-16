import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class NotLogin extends StatefulWidget {
  const NotLogin({super.key});

  @override
  State<NotLogin> createState() => _NotLoginState();
}

class _NotLoginState extends State<NotLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 225,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Bookmark yet, Log in to view and sync your Bookmarks",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 23),
            SizedBox(
              width: 85,
              height: 25,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                child: const MyText(
                  text: "Login",
                  size: 11,
                  weight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
