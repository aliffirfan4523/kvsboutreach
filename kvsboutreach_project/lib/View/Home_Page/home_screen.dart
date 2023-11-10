
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Widget/Card_Homepage/card_homepage.dart';
import 'package:kvsboutreach_project/View/Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import 'package:kvsboutreach_project/View/Widget/Side_Drawer/side_drawer.dart';
import 'package:kvsboutreach_project/View/index_screen.dart';


class Home_Screen extends StatefulWidget {


  Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: sideDrawer(),
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Color(0xffF8FAF0),
        body: CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(
              scaffoldKey: _scaffoldKey,
              primary_title: "KVSB Outreach",
              expandedTitleScaleRadius: 1.5,
              background: Container(
                padding: EdgeInsets.only(top: 105, left: 50),
                decoration: BoxDecoration(
                  color: Color(0xffF8FAF0),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                  ),
                ),
                child: Text(
                  "Selamat Datang ke",
                  style: TextStyle(
                    color: Color(0xff042100),
                    fontSize: 18.0,
                  ) //TextStyle
                ), //Text,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10),
            ), //SliverPadding
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 50, right: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ini merupkan sebuah aplikasi yang menyediakan maklumat berkenaan kursus-kursus yang terdapat di Kolej Vokasional Sungai Buloh",
                    style: TextStyle(
                      color: Color(0xff042100),
                      fontSize: 15.0,
                    ) //TextStyle
                  ),
                ),
              )
            ),
            SliverToBoxAdapter(
              child:  Divider( 
                height: 50, 
                color: Colors.green, 
                thickness: 1, 
                indent: 20, 
                endIndent: 20, 
              ), 
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Index_Screen(),
                      )
                    );
                    print("Card $index");
                  },
                  child: Card_Homepage(
                    title: "$index", 
                    image_url: "https://drive.google.com/uc?export=view&id=1tLpdSf1u8FxUvy0SCrjZ17g3H4rD5eYS",
                  ),
                ), //ListTile
              childCount: 51,
            ), //SliverChildBuildDelegate
          ) //SliverList
        ], //<Widget>[]
      ) //CustonScrollView
    );
  }
}
