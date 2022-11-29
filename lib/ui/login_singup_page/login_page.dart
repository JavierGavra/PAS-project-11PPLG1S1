import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/common/svg_assets.dart';
import 'package:pas_project_11pplg1s1/ui/bottom_navigation/bottom_navigation.dart';
import 'package:pas_project_11pplg1s1/ui/login_singup_page/register_page.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onClickedSignUp});
  final VoidCallback onClickedSignUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future singInWithEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            content: Text("Log In failed, maybe something went wrong !")),
      );
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20),
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.pushReplacement(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const BottomNavBar()));
      //         },
      //         child: Row(
      //           children: const [
      //             MyText(
      //               text: "Not Now",
      //               size: 12,
      //               weight: FontWeight.w600,
      //               color: Color(0x80263238),
      //             ),
      //             SizedBox(width: 4),
      //             Icon(Icons.arrow_forward, size: 16, color: Color(0x80263238)),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Container(
        height: screenSize.height,
        padding: const EdgeInsets.only(bottom: 16),
        // alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
            const SizedBox(height: 77),
            SizedBox(
              height: 40,
              width: 298,
              child: TextField(
                controller: emailController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintStyle: TextStyle(fontSize: 14, fontFamily: "Roboto"),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              width: 298,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
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
                onPressed: singInWithEmail,
                style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                child: const Text(
                  "Log In",
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
              style: TextStyle(color: Color(0xff9CA6C1), fontFamily: "Roboto"),
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
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.black),
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
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.blue),
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
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontFamily: "Roboto", color: Color(0xFF9CA6C1)),
                text: "Don't have account? ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: "Create now",
                    style: const TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
