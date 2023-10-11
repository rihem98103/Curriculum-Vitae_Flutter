//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
/*import 'package:cvversion2/pages/contact_page.dart';
import 'package:cvversion2/pages/experience_page.dart';
import 'package:cvversion2/pages/parametre_page.dart';
import 'package:cvversion2/pages/portfolio_page.dart';
import 'package:cvversion2/pages/team_page.dart';
import 'package:flutter/material.dart';


class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  // declare and initizlize the page controller
  final pageViewController = PageController(initialPage: 2, keepPage: true);

  // this list holds all the pages
  final List<Widget> pages = const [
    ContactPage(),
    ExperiencePage(),
    PortfolioPage(),
    TeamPage(),
    ParameterPage(),
  ];

  // the index of the current page
  int activePageIndex = 2;

  void pageViewOnPageChanged(int page) {
    setState(() {
      activePageIndex = bottomSelectedIndex = page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  // the index of the bottom navigation bar
  int bottomSelectedIndex = 2;

  List<TabItem> buildBottomNavBarItems() {
    return <TabItem>[
      const TabItem(
        icon: Icon(Icons.home),
      ),
      const TabItem(
        icon: Icon(Icons.school),
      ),
      const TabItem(
        icon: Icon(Icons.home),
      ),
      const TabItem(
        icon: Icon(Icons.settings),
      ),
      const TabItem(
        icon: Icon(Icons.mail),
      ),
    ];
  }

  void bottomNavigationBarOnTap(int index) {
    setState(() {
      bottomSelectedIndex = activePageIndex = index;
      pageViewController.animateToPage(index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCirc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // the page view
          PageView.builder(
            controller: pageViewController,
            onPageChanged: pageViewOnPageChanged,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index % pages.length];
            },
          ),

          // Display the dots indicator
          /* Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  pages.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            pageViewController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 8,
                            // check if a dot is connected to the current page
                            // if true, give it a different color
                            foregroundColor: activePageIndex - 2 == index
                                ? const Color(0XFFB4CAD5)
                                : Colors.grey,
                          ),
                        ),
                      )),
            ),
          ),
        */
        ],
      ),

      // Bottom Navigation Bar
      /*  bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          color: const Color(0XFFB4CAD5),
          curveSize: 150,
          height: 60,
          backgroundColor: Colors.white,
          activeColor: const Color(0XFFB4CAD5),
          initialActiveIndex: bottomSelectedIndex,
          onTap: bottomNavigationBarOnTap,
          items: buildBottomNavBarItems(),
        ) */
    );
  }
}*/
