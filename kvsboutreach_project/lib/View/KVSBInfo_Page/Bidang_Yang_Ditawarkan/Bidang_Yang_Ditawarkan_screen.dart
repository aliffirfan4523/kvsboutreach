import 'package:flutter/material.dart';

import '../../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../../Widget/Side_Drawer/side_drawer.dart';

class BidangYangDitawarkan extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String visi = "Peneraju Pendidikan Teknikal dan Vokasional yang unggul.";
  final String misi = "Memperkasakan pendidikan teknikal dan vokasional melalui pelaksanaan program yang berkualiti.";
  final String falsafah = "Semua pelajar KVSB mempunyai kebolehan dan potensi untuk berkembang dari aspek intelek, emosi, rohani dan jasmani.\n\nPara pendidik pula mempunyai ilmu pengetahuan dan kemahiran professional bagi mengembangkan potensi mereka secara berterusan";
  
  final List<String> objektif = [
    "Memberi pendedahan pendidikan vokasional berkualiti   tinggi kepada semua pelajar.",
    "Mencapai keputusan yang cemerlang dan berkualiti dalam peperiksaan Sijil Vokasional Malaysia dan Diploma Vokasional Malaysia.",
    "Melibatkan pelajar dalam semua pertandingan kurikulum dan kokurikulum dan memastikan pencapaian mereka unggul di semua peringkat yang disertai.",
    "Menghasilkan modal insan yang mencukupi ciri-ciri kepimpinan dan mengamalkan budaya cemerlang pada setiap masa.",
    "Menyediakan sumber tenaga manusia berkemahiran untuk keperluan kemajuan Negara.",
  ];

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