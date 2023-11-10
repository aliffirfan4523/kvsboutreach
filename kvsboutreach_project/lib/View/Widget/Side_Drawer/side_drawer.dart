
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kvsboutreach_project/View/index_screen.dart';


Padding sideDrawer({bool isEndDrawer = false}){

  List<IconTextButton> buttonList = [
    IconTextButton(
      icon: FontAwesome5.desktop,
      text: tr("pengenalan.title"),
      location: Index_Screen(),
      heroTag: 'pengenalan'),
      //tempoh pengajian
    IconTextButton(
      icon: Icons.calendar_view_month_rounded,
      text: tr("tempoh_pengajian.tempoh_pengajian_mb_title"),
      location: Index_Screen(),
      heroTag: 'tempoh_pengajian'),
    //senarai kursus yang ditawarkan
    IconTextButton(
      icon: Icons.subject_rounded,
      text: tr("senarai_kursus.senarai_kursus_mb_title"),
      location: const Index_Screen(),
      heroTag: 'senarai_kursus_ditawarkan'),
    //pengiktirafan
    IconTextButton(
      icon: FontAwesomeIcons.award,
      text: tr("pengiktirafan.pengiktirafan_mb_title"),
      location: const Index_Screen(),
      heroTag: 'pengiktirafan'),
    IconTextButton(
      icon: FontAwesomeIcons.handshake,
      text: tr("program_ibm.program_ibm_mb_title"),
      location: Index_Screen(),
      heroTag: 'kerjasama_ibm'),
    //senarai pensyarah
    IconTextButton(
      icon: Icons.person_rounded,
      text: tr("senarai_pensyarah.senarai_pensyarah_mb_title"),
      location: Index_Screen(),
      heroTag: 'senarai_pensyarah'),
    IconTextButton(
      icon: FontAwesome5.question_circle,
      text: tr("syarat_permohonan.syarat_permohonan_mb_title"),
      location: Index_Screen(),
      heroTag: 'syarat_permohonan'),
    IconTextButton(
      icon: FontAwesome5.running,
      text: tr("aktiviti_pelajar.aktiviti_pelajar_mb_title"),
      location: Index_Screen(),
      heroTag: 'Aktiviti_Pelajar'),
    IconTextButton(
      icon: FontAwesome5.phone,
      text: tr("pertanyaan_lanjut.pertanyaan_lanjut_mb_title"),
      location: Index_Screen(),
      heroTag: 'pertanyaan_lanjut'),
    /*IconTextButton(
      icon: Icons.settings_rounded,
      text: tr("tetapan.tetapan_mb_title"),
      location: Setting(),
      heroTag: 'tetapan'),*/
    ];
  
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, top: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: isEndDrawer ? Radius.circular(25) : Radius.circular(0),
        bottomRight: isEndDrawer ? Radius.circular(0) : Radius.circular(25),
        topLeft: isEndDrawer ? Radius.circular(25) : Radius.circular(0),
        topRight: isEndDrawer ? Radius.circular(0) : Radius.circular(25),
      ),
      child: Drawer(
        width: 250,
        child: ListView.builder(
          itemCount: buttonList.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              // Drawer header
              return SizedBox(
                height: MediaQuery.of(context).size.height/10,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade600,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 60,
                        height: 40,
                        ),
                      Image.asset(
                        "assets/images/sec_logo.png",
                        width: 70,
                        height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if(index<10){
              // Drawer button
              final button = buttonList[index - 1];
              return Column(
                children: [
                  ListTile(
                    leading: Icon(button.icon),
                    title: Text(button.text),
                    onTap: () {
                      // Navigate to the corresponding screen when button is tapped
                      Navigator.pop(context);
                      Get.off(button.location, transition: Transition.cupertino, duration: const Duration(milliseconds: 100));
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => button.location));
                    },
                  ),
                  Divider()
                ],
              );
            } else{
              return Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Center(
                  child: Text("ISK Outreach x ISK Company v1.0", style: TextStyle(fontSize: 10),),
                ),
              );
            }
          },
        ),
      ),
    ),
  );
}

tr(String s) {
  return s;
}

class IconTextButton extends StatelessWidget {
  IconTextButton(
      {required this.icon,
      required this.text,
      required this.location,
      required this.heroTag,
      super.key});

  IconData icon;
  String text;
  Widget location;
  String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(location, transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            children: [
              Hero(
                  tag: heroTag,
                  child: Icon(
                    icon,
                    size: 15,
                    color: Colors.white,
                  )),
              AutoSizeText(
                text,
                maxFontSize: 11,
                minFontSize: 9,
                style: const TextStyle(fontSize: 11, color: Colors.white),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}