import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Bidang_Yang_Ditawarkan/Bidang_Yang_Ditawarkan_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Dasar_Kolej/Dasar_Kolej_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Perakuan_Akreditasi_MBOT/Perakuan_Akreditasi_MBOT_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Piagam_Pelanggan/Piagam_Pelanggan_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Tentang_KVSB/Tentang_KVSB_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Visi_&_Misi/Visi_&_Misi_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/WebView_Page/WebView_screen.dart';


import '../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import 'Perakuan_Akreditasi_MQA/Perakuan_Akreditasi_MQA_screen.dart';

class InfoKVSB extends StatefulWidget {
  const InfoKVSB({super.key});

  @override
  State<InfoKVSB> createState() => _InfoKVSBState();
}

class _InfoKVSBState extends State<InfoKVSB> {

	final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<TwoTypes> title = [
    TwoTypes("Tentang KVSB", TentangKVSB()),
    TwoTypes("Visi & Misi", VisiMisi()),
    TwoTypes("Piagam Pelanggan", PiagamPelanggan()),
    TwoTypes("Dasar Kolej", DasarKolej()),
    TwoTypes("Bidang Yang Ditawarkan", BidangYangDitawarkan()),
    TwoTypes("Perakuan Akreditasi MBOT", PerakuanAkreditasiMBOT()),
    TwoTypes("Perakuan Akreditasi MQA", PerakuanAkreditasiMQA()),
    TwoTypes("Permohonan Online", WebViewApp(urlPath: 'https://spskt4.moe.gov.my/spat4_mohon/index.cfm',)),
    TwoTypes("eTVET", WebViewApp(urlPath: 'http://etvet.moe.edu.my/',)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    	extendBodyBehindAppBar: true,
      //drawer: sideDrawer(),
      key: _scaffoldKey,
      body: CustomScrollView(
      	slivers: [
      		CustomSliverAppBar(
            scaffoldKey: _scaffoldKey,
            primary_title: "Info KVSB",
            textColor: Color(0xffF8FAF0),
            expandedTitleScaleRadius: 1.5,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  ),
              ),
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

          SliverList(
					  delegate: SliverChildBuilderDelegate(
					    (context, index) => Card(
					      child: ListTile(
					        title: Text(title[index].string), // Use the title property of TwoTypes
					        trailing: Icon(Icons.arrow_forward_ios),
					        onTap: () {
					          Navigator.push(
											context, 
											MaterialPageRoute(
												builder: (context) => title[index].path,
											),
										);
					          print(title[index].string);
					        },
					      ),
					    ),
					    childCount: title.length,
					  ),
					),
      	],
      ),
    );
  }
}

class TwoTypes {
  final String string;
  final Widget path;

  TwoTypes(this.string, this.path);
}