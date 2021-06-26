import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/constants/device_screen_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          print(homeController.listTafsirFromirebase.length);
          return Container();
        },
      ),
    );
  }
}
