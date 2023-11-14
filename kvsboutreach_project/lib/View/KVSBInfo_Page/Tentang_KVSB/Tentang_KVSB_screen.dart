import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Widget/ImagePreviewWidget/ImagePreviewWidget.dart';

import '../../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../../Widget/Side_Drawer/side_drawer.dart';

class TentangKVSB extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            scaffoldKey: _scaffoldKey,
            primary_title: "Tentang KVSB",
            expandedTitleScaleRadius: 1.5
          ),
          SliverToBoxAdapter(
            child: ImagePreview(imageUrl: "https://drive.google.com/uc?export=view&id=11wZ9l9yOhzHLLw83UsuAAFMad7xf4uJf",),

          ),
        ],
      ),
    );
  }
}