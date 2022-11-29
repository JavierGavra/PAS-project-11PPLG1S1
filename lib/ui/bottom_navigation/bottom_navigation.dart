import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/ui/account/account_page.dart';
import 'package:pas_project_11pplg1s1/ui/home/home_page.dart';
import 'package:pas_project_11pplg1s1/ui/search/search_page.dart';
import 'package:pas_project_11pplg1s1/ui/wishlist/wishlist_page.dart';
import 'package:pas_project_11pplg1s1/widgets/navbar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final pages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const WishlistPage(),
    const AccountPage(),
  ];

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomAppBar(
          // elevation: 0,
          // color: Colors.transparent,
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavbarItem(
                icon: Icons.home_outlined,
                iconSelcted: Icons.home,
                indexItem: 0,
                index: index,
                onChangedTab: onChangedTab),
            NavbarItem(
                icon: Icons.search_outlined,
                iconSelcted: Icons.search,
                indexItem: 1,
                index: index,
                onChangedTab: onChangedTab),
            NavbarItem(
                icon: Icons.bookmark_border,
                iconSelcted: Icons.bookmark,
                indexItem: 2,
                index: index,
                onChangedTab: onChangedTab),
            NavbarItem(
                icon: Icons.person_outline,
                iconSelcted: Icons.person,
                indexItem: 3,
                index: index,
                onChangedTab: onChangedTab),
          ],
        ),
      )),
    );
  }
}
