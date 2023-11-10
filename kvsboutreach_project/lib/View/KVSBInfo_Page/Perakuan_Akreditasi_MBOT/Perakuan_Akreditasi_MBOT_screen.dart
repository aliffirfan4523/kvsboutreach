import 'package:flutter/material.dart';

import '../../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../../Widget/Side_Drawer/side_drawer.dart';

class PerakuanAkreditasiMBOT extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: sideDrawer(),
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            scaffoldKey: _scaffoldKey,
            primary_title: "Info KVSB",
            expandedTitleScaleRadius: 1.5
          ),

        ],
      ),
    );
  }
}