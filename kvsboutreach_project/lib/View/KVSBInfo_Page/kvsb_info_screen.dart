import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/Model/KVSBInfo/KVSBInfoModel.dart';

import 'package:kvsboutreach_project/utils/constants.dart';

import '../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';

class InfoKVSB extends StatefulWidget {
  const InfoKVSB({super.key});

  @override
  State<InfoKVSB> createState() => _InfoKVSBState();
}

class _InfoKVSBState extends State<InfoKVSB> {

	final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    	extendBodyBehindAppBar: true,
      //drawer: sideDrawer(),
      key: _scaffoldKey,
      body: NestedScrollView(
        floatHeaderSlivers: true,
      	headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 20, bottom: 15),
                title: Text(
                  "Info KVSB",
                  style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 20,
                  ) //TextStyle
                ),
                background: Container(
                  child: CachedNetworkImage(
                    color: Colors.black,
                    imageUrl: "https://drive.google.com/uc?export=view&id=1tLpdSf1u8FxUvy0SCrjZ17g3H4rD5eYS",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), // Adjust color and opacity as needed
                              BlendMode.srcOver, // Blend mode to control how the color is applied
                            ),
                            fit: BoxFit.cover,
                            //colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),
                    ),
                    //placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              floating: false,
              pinned: false,
              expandedHeight: 200.0,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: AppColors.primaryColor,
            )
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: AppColors.textColor,
              height: 100,
              child: Center(child: Text('Item $index')),
            );
          }, 
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 15,
            childAspectRatio: 1.5,
          )
        ),
      ),
    );
  }
}
