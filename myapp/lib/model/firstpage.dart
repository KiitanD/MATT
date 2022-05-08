import 'package:flutter/material.dart';
import 'package:myapp/model/content_view.dart';
import 'package:myapp/model/custom_tab.dart';
import 'package:myapp/model/custom_tab_bar.dart';
import 'package:myapp/model/signinfinal.dart';
import 'package:myapp/model/signinview.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenWidth;
  late double screenHeight;
  late double topPadding;
  late double bottomPadding;
  late TabController tabController;
  List<ContentView> contentViews = [
    ContentView(CustomTab(title: 'Sign up'), SigninView()),
    ContentView(CustomTab(title: 'Sign in'), SignInFinal()),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
      backgroundColor: Color(0xffb71c1c),
      endDrawer: drawer(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        }),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTabBar(
          controller: tabController,
          tabs: contentViews.map((e) => e.tab).toList(),
        ),
        Container(
          height: screenHeight * 0.85,
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: screenWidth * 0.08,
              icon: Icon(Icons.menu_rounded),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
              Container(
                height: screenHeight * 0.01,
              )
            ] +
            contentViews
                .map((e) => Container(
                      child: ListTile(
                        title: Text(e.tab.title),
                        onTap: () {},
                      ),
                    ))
                .toList(),
      ),
    );
  }
}
