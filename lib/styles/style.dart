import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tafsir_app/constants/device_screen_size.dart';

final titreStyle = GoogleFonts.roboto(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: isSmallScreen(Get.width)? 15:18
);
