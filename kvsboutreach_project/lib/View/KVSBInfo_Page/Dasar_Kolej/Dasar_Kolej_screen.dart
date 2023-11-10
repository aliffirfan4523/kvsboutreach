import 'package:flutter/material.dart';

import '../../Widget/CustomSliverAppBar/CustomSliverAppBar_widget.dart';
import '../../Widget/Side_Drawer/side_drawer.dart';

class DasarKolej extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<List<String>> dasarPengurusan = [
    [
      "Sahsiah Mulia",
      "Menjadi amalan kami  yang dapat menyerlahkan budaya dan watak kolej.",
    ],
    [
      "Muafakat",
      "Merupakan budaya kerja kami untuk mewujudkan semangat kerja berpasukan ke arah satu matlamat yang sama.",
    ],
    [
      "Visi Cemerlang",
      "Merupakan wawasan yang menjadi pendorong untuk terus cemerlang.",
    ],
    [
      "Semangat Tinggi",
      "Menjadi asas perjuangan kami ke arah mencapai kecemerlangan dalam semua bidang.",
    ],
    [
      "Boleh",
      "Merupakan cogan kata kami untuk menanam keyakinan bahawa KVSB adalah yang terbaik.",
    ],
  ];

  List<List<String>> dasarAkademik = [
    [
      "Motto Akademik",
      "“ Belajar Untuk Cemerlang,   Mengajar Untuk Cemerlang”",
    ],
    [
      "Misi Akademik",
      "“ Menjadi antara 5 Kolej Vokasional  Terbaik di Malaysia”",
    ],
    [
      "Pengurusan Akademik",
      "Melaksanakan P&P yang berkesan.\n",
      "Memantau P&P secara berterusan.\n",
      "Melaksanakan penilaian dan pentaksiran.\n",
      "Menggunakan sumber pengajaran dan pembelajaran yang maksimum.",
      "",
    ],
  ];

  List<List<String>> dasarSokonganAkademik = [
    [
      "Hal Ehwal Pelajar",
      "Disiplin tetap nombor 1",
      "Semua pensyarah adalah pensyarah disiplin",
      "Melaksanakan Program Mentor-Mentee",
      "Menguatkuasakan Sistem Demerit",
      "Menguatkuasakan sistem kawalan keluar masuk kelas",
      "Mengamalkan budaya cemerlang pada setiap masa",
      "Memberi ganjaran bagi setiap kecemerlangan dan hukuman bagi setiap kesalahan",
      "Kemudahan asrama adalah satu keistimewaan bukan hak kepada pelajar",
    ],
    [
      "Kokurikulum",
      "Menyertai semua aktiviti kokurikulum anjuran PPD/JPN/BPLTV",
      "Memakai pakaian badan beruniform  pada setiap hariRabu",
      "Mewajibkan setiap pelajar menyertai sekurang kurangnya 3 aktiviti kokurikulum",
      "Membentuk pasukan elit yang  bermatlamatkan juara",
      "Mengadakan acara karnival tahunan kolej pada setiap tahun",
      "Menetapkan sasaran untuk berjaya  dalam pertandingan sehingga ke peringkat tertinggi",
    ],
  ];

  DasarKolej({super.key});

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
              primary_title: "Dasar Kolej",
              expandedTitleScaleRadius: 1.5),
        ],
      ),
    );
  }
}
