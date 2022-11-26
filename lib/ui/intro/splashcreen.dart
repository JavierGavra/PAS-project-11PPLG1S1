import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/common/svg_assets.dart';
import 'package:pas_project_11pplg1s1/ui/intro/introduction_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroPage()));
    });

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(splash_icon, color: accentColor),
      ),
    );
  }
}
