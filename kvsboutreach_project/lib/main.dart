
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Home_Page/home_screen.dart';
import 'package:kvsboutreach_project/View/Programme_List_Page/programme_list_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'View/KVSBInfo_Page/kvsb_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  late PageController _pageController;
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(true),
              thickness: MaterialStateProperty.all(10),
              thumbColor: MaterialStateProperty.all(Color(0xff386A20)),
              radius: const Radius.circular(10),
              minThumbLength: 100)),
      home: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            Home_Screen(),
            InfoKVSB(),
            SenaraiProgram(),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
          child: buildSalomonBottomBar(),
        ),
      ),
    );
  }

  SalomonBottomBar buildSalomonBottomBar() {
    return SalomonBottomBar(
          backgroundColor: Color(0xff386A20),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: currentIndex,
          margin: EdgeInsets.all(10),
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
              bottomLeft: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
            ),
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            
            _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 300), 
              curve: Curves.easeIn
            );
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: Text(
                _buildTitle('Laman Utama', currentIndex == 0),
                style: TextStyle(fontSize: 12),
              ),
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.school),
              title: Text(
                _buildTitle('  Info KVSB', currentIndex == 1),
                style: TextStyle(fontSize: 12),
              ),
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.tasks),
              title: Text(
                _buildTitle('Program-Program', currentIndex == 2),
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        );
  }
}
  String _buildTitle(String title, bool isTrue) {
    return  isTrue ? title : '' ;
  }


