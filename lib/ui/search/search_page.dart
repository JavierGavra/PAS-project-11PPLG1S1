import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';
import 'package:pas_project_11pplg1s1/ui/search/after_search.dart';
import 'package:pas_project_11pplg1s1/ui/search/before_search.dart';
import 'package:pas_project_11pplg1s1/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? _scrollController;
  final double _height = 149;
  bool _lastStatus = true;
  bool isSearch = false;

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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            stretch: true,
            pinned: true,
            expandedHeight: 149,
            backgroundColor: primaryColor,
            title: _isShrink
                ? const MyText(
                    text: "Search", size: 16, weight: FontWeight.w600)
                : null,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  children: [
                    const MyText(
                        text: "Search", size: 16, weight: FontWeight.w600),
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
          isSearch ? const AfterSearch() : const BeforeSearch()
        ],
      ),
    );
  }
}
