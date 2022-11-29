import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pas_project_11pplg1s1/ui/login_singup_page/login_page.dart';
import 'package:pas_project_11pplg1s1/ui/login_singup_page/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : RegisterPage(onClickedSignIp: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
