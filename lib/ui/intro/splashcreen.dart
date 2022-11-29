import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/common/svg_assets.dart';
import 'package:pas_project_11pplg1s1/ui/bottom_navigation/bottom_navigation.dart';
import 'package:pas_project_11pplg1s1/ui/intro/introduction_page.dart';
import 'package:pas_project_11pplg1s1/ui/define_main_page/define_page.dart';
import 'package:pas_project_11pplg1s1/ui/login_singup_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isIntroDone = false;

  Future<bool> getIntroDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isIntroDone') ?? false;
  }

  void movePage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isIntroDone ? const DefineIntroPage() : const IntroPage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIntroDone().then((value) {
      isIntroDone = value;
      setState(() {});
    });
    movePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(splash_icon, color: accentColor),
      ),
    );
  }
}
