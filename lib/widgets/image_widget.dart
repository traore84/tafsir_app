import 'package:flutter/material.dart';
import 'package:get/get.dart';

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