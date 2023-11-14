
import 'package:flutter/material.dart';

import 'package:kvsboutreach_project/View/KVSBInfo_Page/Bidang_Yang_Ditawarkan/Bidang_Yang_Ditawarkan_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Dasar_Kolej/Dasar_Kolej_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Perakuan_Akreditasi_MBOT/Perakuan_Akreditasi_MBOT_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Perakuan_Akreditasi_MQA/Perakuan_Akreditasi_MQA_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Piagam_Pelanggan/Piagam_Pelanggan_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Tentang_KVSB/Tentang_KVSB_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/Visi_&_Misi/Visi_&_Misi_screen.dart';
import 'package:kvsboutreach_project/View/KVSBInfo_Page/WebView_Page/WebView_screen.dart';

class KVSBInfoModel {
  final String string;
  final Widget path;

  KVSBInfoModel(this.string, this.path);
}

List<KVSBInfoModel> kvsbInfoTitle = [
  KVSBInfoModel("Tentang KVSB", TentangKVSB()),
  KVSBInfoModel("Visi & Misi", VisiMisi()),
  KVSBInfoModel("Piagam Pelanggan", PiagamPelanggan()),
  KVSBInfoModel("Dasar Kolej", DasarKolej()),
  KVSBInfoModel("Bidang Yang Ditawarkan", BidangYangDitawarkan()),
  KVSBInfoModel("Perakuan Akreditasi MBOT", PerakuanAkreditasiMBOT()),
  KVSBInfoModel("Perakuan Akreditasi MQA", PerakuanAkreditasiMQA()),
  KVSBInfoModel("Permohonan Online", WebViewApp(urlPath: 'https://spskt4.moe.gov.my/spat4_mohon/log_masuk.cfm',)),
  KVSBInfoModel("eTVET", WebViewApp(urlPath: 'http://etvet.moe.edu.my/',)),
];