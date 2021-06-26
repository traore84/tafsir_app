import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/constants/device_screen_size.dart';
import 'package:tafsir_app/constants/text_constant.dart';

import 'package:tafsir_app/controllers/home_controllers.dart';
import 'package:tafsir_app/styles/style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          titre,
          style: titreStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(
        () {
          print(homeController.listtafsir.length);
          return SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  banerImage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget banerImage() {
    return Container(
      height: Get.height * .3,
      width: Get.width * .8,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(1,1),
            )
          ]),
    );
  }
}
