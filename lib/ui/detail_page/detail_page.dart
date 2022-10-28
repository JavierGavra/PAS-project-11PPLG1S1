import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  TabController? _tabController;
  int x = 0;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Detail")),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "American Steak",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                "American Food",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 50),
              Container(
                width: 210,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(-5, 5),
                          blurRadius: 10,
                          color: Color(0x80ffffff)),
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          color: Color(0x40AAAACC)),
                      BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 20,
                          color: Color(0x80AAAACC)),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          blurRadius: 20,
                          color: Colors.white),
                    ]),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                      color: Color(0xffEA3636),
                      borderRadius: BorderRadius.circular(10)),
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      child: Text("Ingredient",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                    Tab(
                      child: Text("Nutritions",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, 202)
      ..lineTo(109, size.height)
      ..lineTo(size.width, 288)
      // ..quadraticBezierTo(
      //   109,
      //   size.height,
      //   size.width,
      //   288,
      // )
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
