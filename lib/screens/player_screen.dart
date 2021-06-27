import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/constants/text_constant.dart';
import 'package:tafsir_app/controllers/player_controller.dart';
import 'package:tafsir_app/styles/color_style.dart';
import 'package:tafsir_app/styles/style.dart';
import 'package:tafsir_app/widgets/image_widget.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({Key? key}) : super(key: key);
  final playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          playerAppBarText,
          style: playerAppBarTextStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: Get.height * .2,
            child: Container(
              color: primaryColor,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: Get.height * .16,
            height: Get.height - Get.height * .16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: playerBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget playerBody() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              banerImage(),
              Container(
                child: Text(
                  'Assise 001',
                  style: playerBodyTextStyle,
                ),
              ),
              slider(),
              playerControls(),
            ],
          ),
        ),
        playerBottomControls(),
      ],
    );
  }

  Widget playerBottomControls() {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Container(
              child: Icon(
                Icons.repeat,
                color: Colors.black,
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget playerControls() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              child: Icon(
                Icons.skip_previous,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            child: Container(
              child: Icon(
                Icons.play_arrow,
                color: primaryColor,
                size: 60,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            child: Container(
              child: Icon(
                Icons.skip_next,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slider() {
    return Container(
      width: Get.width,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 20,
          thumbShape: RoundSliderThumbShape(
              elevation: 0, disabledThumbRadius: 11, enabledThumbRadius: 11),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                '52:20',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Container(
              width: Get.width - 80,
              child: Obx(
                () => Slider(
                    activeColor: primaryColor,
                    max: 100,
                    min: 0,
                    value: playerController.sliderValue.value,
                    onChanged: (val) {
                      playerController.sliderValue.value = val;
                    }),
              ),
            ),
            Container(
              child: Text(
                '52:20',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
