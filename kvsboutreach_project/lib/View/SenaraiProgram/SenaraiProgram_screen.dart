import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Widget/Side_Drawer/side_drawer.dart';
import 'package:kvsboutreach_project/utils/constants.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../Model/SenaraiProgram/SenaraiProgramModel.dart';
import '../Widget/Card_Homepage/card_homepage.dart';
import '../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../index_screen.dart';

class SenaraiProgram extends StatefulWidget {

	SenaraiProgram({super.key});

  @override
  State<SenaraiProgram> createState() => _SenaraiProgramState();
}

class _SenaraiProgramState extends State<SenaraiProgram> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    	//extendBodyBehindAppBar: true,
      //drawer: sideDrawer(),
      key: _scaffoldKey,
      body:	Scrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              scaffoldKey: _scaffoldKey,
              primary_title: "Program-Program di KVSB",
              expandedTitleScaleRadius: 1.5,
              isPinned: false,
              firstTitleFontSize: 15,
              
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                controller: _scrollController,
                primary: false,
                shrinkWrap: true,
                itemCount: senaraiPrograms.length,
                itemBuilder: (context, index) {
                  return StickyHeader(
                    header: Container(
                      height: 38.0,
                      color: Color(0xffF8FAF0),
                      padding: new EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: Alignment.centerLeft,
                      child: new Text(senaraiPrograms[index].jabatan,
                        style: const TextStyle(color: AppColors.textColor, fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: senaraiPrograms[index].programs.length,
                      itemBuilder: (context, indx) => InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Index_Screen(),
                              )
                            );
                            print("Card $index");
                          },
                          child: Card_Homepage(
                            title: senaraiPrograms[index].programs[indx],
                            image_url: "https://drive.google.com/uc?export=view&id=1tLpdSf1u8FxUvy0SCrjZ17g3H4rD5eYS",
                          ),
                        ), //ListTile
                    ) //SliverList
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}