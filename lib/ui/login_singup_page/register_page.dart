import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/common/svg_assets.dart';
import 'package:pas_project_11pplg1s1/ui/bottom_navigation/bottom_navigation.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onClickedSignIp});
  final Function() onClickedSignIp;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future singUpWithEmail() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            content: Text("Sign Up failed, maybe something went wrong !")),
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
      body: Form(
        key: formKey,
        child: Container(
          height: screenSize.height,
          padding: const EdgeInsets.only(bottom: 16),
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
                SizedBox(
                  height: 40,
                  width: 298,
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 14),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email !'
                            : null,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Roboto")),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  width: 298,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    style: const TextStyle(fontSize: 14),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                        password != null && password.length < 6
                            ? 'Enter min. 6 characters !'
                            : null,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Roboto")),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 40,
                  width: 298,
                  child: ElevatedButton(
                    onPressed: singUpWithEmail,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: accentColor),
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
                            SvgPicture.asset(icon_google,
                                height: 18, width: 18),
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
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontFamily: "Roboto", color: Color(0xFF9CA6C1)),
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIp,
                        text: "Login",
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
        ),
      ),
    );
  }
}
