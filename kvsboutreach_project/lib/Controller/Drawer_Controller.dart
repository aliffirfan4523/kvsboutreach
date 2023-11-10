import 'package:flutter/material.dart';

class Drawer_Controller{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }
}