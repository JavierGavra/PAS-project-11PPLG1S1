import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/define_main_page/define_page.dart';
import 'package:pas_project_11pplg1s1/ui/login_singup_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isOn = false;
  bool isIntroDone = false;

  Future<void> setPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isIntroDone', isIntroDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: AnimatedContainer(
              // color: Colors.blue,
              duration: const Duration(milliseconds: 1300),
              curve: Curves.easeOutQuint,
              height: isOn ? 0 : MediaQuery.of(context).size.height - 325,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/intro_img.png",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const SizedBox(height: 18),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: isOn ? 0 : 1,
            child: SizedBox(
              width: 265,
              child: Column(
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Easy Cooking at Home With "),
                        TextSpan(
                            text: "Lezzat",
                            style: TextStyle(color: accentColor)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Let’s make home cooking more special with recipes from Lezzat",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                  const SizedBox(height: 61),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isOn = !isOn;
                          isIntroDone = true;
                          setPreference();
                        });
                        Timer(const Duration(milliseconds: 1400), () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DefineIntroPage()));
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(accentColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2,
        size.height - 84,
        size.width,
        size.height,
      )
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
