
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Widget/Card_Homepage/card_homepage.dart';
import 'package:kvsboutreach_project/View/Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import 'package:kvsboutreach_project/View/Widget/ImagePreviewWidget/ImagePreviewWidget.dart';
import 'package:kvsboutreach_project/View/index_screen.dart';

import '../../utils/constants.dart';


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
        body: CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(
              isPinned: false,
              scaffoldKey: _scaffoldKey,
              primary_title: "KVSB Outreach",
              textColor: AppColors.textColor,
              expandedTitleScaleRadius: 1.5,
              background: Container(
                padding: EdgeInsets.only(top: 105, left: 50),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                  ),
                ),
                child: Text(
                  "Selamat Datang ke",
                  style: TextStyle(
                    color: AppColors.textColor.withOpacity(0.8),
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
                    "Ini merupakan sebuah aplikasi yang menyediakan maklumat berkenaan kursus-kursus yang terdapat di Kolej Vokasional Sungai Buloh",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 15.0,
                    ) //TextStyle
                  ),
                ),
              )
            ),
            SliverToBoxAdapter(
              child:  Divider( 
                height: 50, 
                color: AppColors.textColor, 
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
