import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/common/svg_assets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: screenSize.height,
        padding: EdgeInsets.only(bottom: 16),
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const SizedBox(height: 161),
              SizedBox(
                width: screenSize.width,
                child: SvgPicture.asset(
                  login_img,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 21),
              const SizedBox(
                height: 40,
                width: 298,
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "Username",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(fontSize: 14, fontFamily: "Roboto"),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 40,
                width: 298,
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintStyle: TextStyle(fontSize: 14, fontFamily: "Roboto")),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                height: 40,
                width: 298,
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintStyle: TextStyle(fontSize: 14, fontFamily: "Roboto")),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                width: 298,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              const SizedBox(height: 42),
              const Text(
                "Or continue with",
                style:
                    TextStyle(color: Color(0xff9CA6C1), fontFamily: "Roboto"),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 141,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(icon_google, height: 18, width: 18),
                          const SizedBox(width: 8),
                          const Text("Google",
                              style: TextStyle(color: Color(0xff9CA6C1)))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 141,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.facebook,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text("Facebook",
                              style: TextStyle(color: Color(0xff9CA6C1)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontFamily: "Roboto", color: Color(0xFF9CA6C1)),
                  ),
                  SizedBox(
                    width: 51,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontFamily: "Roboto"),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
