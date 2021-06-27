import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tafsir_app/constants/text_constant.dart';

import 'package:tafsir_app/controllers/home_controllers.dart';
import 'package:tafsir_app/controllers/player_controller.dart';
import 'package:tafsir_app/data/tafsir_class.dart';
import 'package:tafsir_app/styles/color_style.dart';
import 'package:tafsir_app/styles/style.dart';
import 'package:tafsir_app/widgets/image_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  final playerController = Get.put(PlayerController());

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
                  //bottomBar(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget playlistBody(List<Tafsir> listTafsir) {
    return Expanded(
      child: ListView.builder(
          itemCount: listTafsir.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.download),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        )),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Riyaad Tafasir ${listTafsir[index].titre}',
                          style: rowtitreStyle,
                        ),
                        Text(listTafsir[index].size)
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                        homeController.converTo(listTafsir[index].duration)),
                  ),
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

  Widget bottomBar() {
    return Container(
      width: Get.width,
      height: Get.height * .15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Riyaad Tafasir Assise 001',
              style: bottomBarTextStyle,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    child: Container(
                  child: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                )),
                InkWell(
                    onTap: () {
                       playerController.generateAudioList(homeController.listtafsir);
                      playerController.play();
                    },
                    child: Container(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                    )),
                InkWell(
                    child: Container(
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ))
              ],
            ),
          ),
          Container(
            child: Text(
              '56:25',
              style: bottomBarTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
