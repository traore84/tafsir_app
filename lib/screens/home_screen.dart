import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/constants/device_screen_size.dart';
import 'package:tafsir_app/constants/text_constant.dart';

import 'package:tafsir_app/controllers/home_controllers.dart';
import 'package:tafsir_app/data/tafsir_class.dart';
import 'package:tafsir_app/styles/color_style.dart';
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
          var tafsirList = homeController.listtafsir;
          return SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  banerImage(),
                  !(tafsirList.length == 0)
                      ? playlistBody(tafsirList)
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
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
              offset: Offset(1, 1),
            )
          ]),
    );
  }

  Widget playlistBody(List<Tafsir> listTafsir) {
    return Expanded(
      child: ListView.builder(
          itemCount: listTafsir.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(top: 10,left: 10,right: 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.play_arrow),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        )),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Riyaad Tafasir ${listTafsir[index].titre}',style: rowtitreStyle,),
                        Text(listTafsir[index].size)
                      ],
                    ),
                  ),
                  Container(child: Text(homeController.converTo(listTafsir[index].duration)),),
                  Container(
                    child: Icon(
                      Icons.favorite,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
