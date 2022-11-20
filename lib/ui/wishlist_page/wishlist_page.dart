import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/wishlist_page/not_login.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';
import 'package:pas_project_11pplg1s1/widgets/wishlist_card.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  ScrollController? _scrollController;
  final double _height = 149;
  bool _lastStatus = true;
  bool isLogin = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (_height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != _lastStatus) {
      setState(() {
        _lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: isLogin
          ? CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  stretch: true,
                  pinned: true,
                  expandedHeight: _height,
                  backgroundColor: primaryColor,
                  title: _isShrink
                      ? const MyText(
                          text: "Wishlist", size: 16, weight: FontWeight.w600)
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Column(
                        children: [
                          const MyText(
                              text: "Wishlist",
                              size: 16,
                              weight: FontWeight.w600),
                          const SizedBox(height: 45),
                          Container(
                            height: 40,
                            width: screenSize.width,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x40AAAACC),
                                      offset: Offset(5, 5),
                                      blurRadius: 10),
                                  BoxShadow(
                                      color: Color(0x80AAAACC),
                                      offset: Offset(10, 10),
                                      blurRadius: 20),
                                  BoxShadow(
                                      color: Color(0xffFFFFFF),
                                      offset: Offset(-10, -10),
                                      blurRadius: 20),
                                ]),
                            child: Text("Search Food"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 10,
                      (context, index) {
                        return const WishlistCard();
                      },
                    ),
                  ),
                )
              ],
            )
          : const NotLogin(),
    );
  }
}
