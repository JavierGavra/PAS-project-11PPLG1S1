import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenSize.height / 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor,
                    Color(0x80FF5A00),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 161),
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 97,
                bottom: 75,
              ),
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  MyText(
                      text: "Javier Rasyid Abhifawaz",
                      size: 16,
                      weight: FontWeight.w600),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: MyText(
                        text: user.email!, size: 12, weight: FontWeight.w500),
                  ),
                  const SizedBox(height: 61),
                  button(Icons.account_circle, "Account", () {}),
                  const SizedBox(height: 18),
                  button(Icons.bookmark, "Wishlist", () {}),
                  const SizedBox(height: 18),
                  button(Icons.history, "History", () {}),
                  const SizedBox(height: 18),
                  button(Icons.info, "About", () {}),
                  const SizedBox(height: 18),
                  button(Icons.logout, "Log Out",
                      () => FirebaseAuth.instance.signOut()),
                ],
              ),
            ),
            Positioned(
              top: 96,
              left: (screenSize.width - 130) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 130,
                  height: 130,
                  color: Colors.black,
                  child: Image.asset(
                    "assets/images/gavra_img.jpeg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button(IconData icon, String text, Function()? function) {
    bool isLogOut = text == "Log Out";
    return InkWell(
      onTap: function,
      child: Container(
        height: 50,
        width: 270,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x80AAAACC),
                offset: Offset(10, 10),
                blurRadius: 20),
            BoxShadow(
                color: primaryColor, offset: Offset(-10, -10), blurRadius: 20),
          ],
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 30,
                color: isLogOut ? const Color(0xffFF0000) : secondaryColor),
            const SizedBox(width: 17),
            MyText(
                text: text,
                size: 14,
                weight: FontWeight.w600,
                color: isLogOut ? const Color(0xffFF0000) : secondaryColor),
            const Spacer(),
            Icon(isLogOut ? null : Icons.arrow_forward, size: 25)
          ],
        ),
      ),
    );
  }
}
