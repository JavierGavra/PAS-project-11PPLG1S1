import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/detail_page/detail_page.dart';
import 'package:pas_project_11pplg1s1/ui/wishlist_page/not_login.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';
import 'package:pas_project_11pplg1s1/widgets/wishlist_card.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          text: "Wishlist",
          color: secondaryColor,
          size: 16,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 86,
      ),
      body: isLogin
          ? ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return WishlistCard();
              },
            )
          : const NotLogin(),
    );
  }
}
