import 'package:flutter/material.dart';

import '../../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../../Widget/Side_Drawer/side_drawer.dart';

class PiagamPelanggan extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> piagam = [
    "KVSB dengan penuh tekad dan iltizam berianii akan memastikan :",
    "   Membimbing pelaiar-pelaiar membentuk sahsiah yang mulia melalui pemupukan dan penghayatan serta amalan nilai-nilai murni berdasarkan kepada kepercayaan dan kepatuhan kepada Tuhan selaras dengan Falsafah Pendidikan Negara.",
    "   Mendidik pelaiar-pelaiar dengan pendidikan vokasional berkualiti untuk memghasilkan tenaga manusia yang kompeten, produktif dan berinovatif serta berdaya Saing dan berketerampilan dalam pelbagai bidang kemahiran ke arah pembangunan negara.",
    "   Membimbing pelaiar-pelaiar ke arah kecemerlangan akademik dan kokurikulum untuk meniadikan kolei yang terbaik.",
    "   Memastikan kebaiikan pelaiar diutamakan.",
    "   Memastikan setiap pelaiar menyertai aktiviti sukan dan kokurikulum di kolei.",
    "   Memastikan setiap pelaiar mematuhi peraturan dan tatacara pengaiian",
    "   Mewuiudkan iklim kolei yang bersih, mena rik dan harmoni dan memberi keriasama erat pada semua aktiviti kemasyrakatan yang diperlukan.",
    "   Melahirkan masyarakat berbudi dan berbudaya penyayang.",
    "   Memastikan ibu bapa mendapat maklumat terkini berkaitan pencapaian pelaiar.",
    "   Memastikan semua urusan perkhidmatan dan maklumat staf lengkap dan teratur.",
    "   Memastikan semua staf mendapat maklumat yang tepat dan cepat tentang peluang-peluang peningkatan keriaya.",
    "   Bersedia menerima dan melayan pelanggan yang berurusan dengan kolei.",
    "   Memberi maklumbalas kepada semua surat arahan daripada stakeholders dengan segera.",
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