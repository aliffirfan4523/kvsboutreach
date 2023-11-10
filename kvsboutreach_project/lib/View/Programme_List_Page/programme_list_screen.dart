import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/Widget/Side_Drawer/side_drawer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

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

  List<String> listHeader = [
    "Jabatan Teknologi Mekanikal dan Pembuatan",
    "Jabatan Teknologi Elektrik dan Elektronik", 
    "Jabatan Teknologi Awam", 
    "Jabatan Teknologi Maklumat", 
    "Jabatan Perniagaan ",
    "Jabatan Pendidikan Umum"
  ];

  List<List<String>> programmedetails = [
    [
      'Program Teknologi Automotif',
      'Program Teknologi Pemesinan Industri',
      'Program Teknologi Kimpalan',
      'Program Teknologi Penyejukan & Penyamanan Udara',
    ],
    [
      'Program Teknologi Elektrik',
      'Program Teknologi Elektronik',
    ],
    [
      'Program Teknologi Pembinaan',
    ],
    [
      'Program Teknologi Maklumat',
    ],
    [
      'Program Perakaunan',
    ],
    [
      'Program Pendidikan Umum',
    ],
  ];


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
                primary: false,
                shrinkWrap: true,
                itemCount: listHeader.length,
                itemBuilder: (context, index) {
                  return StickyHeader(
                    header: Container(
                      height: 38.0,
                      color: Color(0xffF8FAF0),
                      padding: new EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: Alignment.centerLeft,
                      child: new Text(listHeader[index],
                        style: const TextStyle(color: Color(0xff386A20), fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: programmedetails[index].length,
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
                            title: programmedetails[index][indx],
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