import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:tafsir_app/data/tafsir_class.dart';
import 'package:tafsir_app/styles/color_style.dart';

class HomeController extends GetxController {
  /// list de tafsir from firebase ///
  RxList<Tafsir> _listTafsirFromirebase = RxList<Tafsir>([]);
  var downloadList = RxList<Tafsir>();


  @override
  void onInit() {
    fetchDataFromFirebase();
 
    var storedDownloadiList = GetStorage().read<List>('downlodList') ?? [];
    if (storedDownloadiList.isNotEmpty) {
      downloadList =
          storedDownloadiList.map((e) => Tafsir.fromJson(e)).toList().obs;
    }
    ever(downloadList, (_) {
      GetStorage().write('downlodList', downloadList.toList());
    });
    super.onInit();
  }

  

  /// fetch data from firebase ///
  fetchDataFromFirebase() {
    FirebaseFirestore.instance
        .collection('TAFSIRS')
        .snapshots()
        .listen((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        _listTafsirFromirebase.add(Tafsir.fromDocumentSnapshot(element));
      });
    });
  }

  /// getter list tafsir from firebase ///
  List<Tafsir> get listtafsir {
    var list = _listTafsirFromirebase;
    list.sort((a, b) => a.titre.compareTo(b.titre));
    return list;
  }

  /// convertir le temps en format 00:00 ///
  String converTo(int temp) {
    var munite = (temp / 60).toStringAsFixed(0);
    var _second = (temp % 60).toStringAsFixed(0);
    var sec = _second.split(':').last;

    return '$munite : ${sec.length == 2 ? _second : _second + '0'}';
  }

  Future<void> downloadFromFirebase(Tafsir tafsir, BuildContext context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    if (!downloadList.contains(tafsir)) {
      var dio = new Dio();
      // ProgressDialog pd = ProgressDialog(context: context);

      pd.show(
        max: 100,
        msg: '${tafsir.titre}...',
        progressType: ProgressType.valuable,
        //backgroundColor: ,
        msgColor: primaryColor,
        progressValueColor: primaryColor,
        valueColor: primaryColor,
      );
      var listDirectory =
          await getExternalStorageDirectories(type: StorageDirectory.music);
      final savedDir = listDirectory![0].path;
      File file = File('$savedDir/Tafsirs/${tafsir.titre}.mp3');
      await dio.download(
        '${tafsir.path}',
        '${file.path}',
        onReceiveProgress: (rec, total) {
          int progress = (((rec / total) * 100).toInt());
          pd.update(value: progress);
          if (rec == total) {
            var e = tafsir;
            listtafsir.remove(tafsir);
            e.isdownload = true;
            listtafsir.add(e);
            downloadList.add(e);
          }
        },
      ).then((value) {
        isDownload();
      }).catchError((value) {
        pd.close();
        Get.snackbar('echec internet', value.toString(),
            titleText: Text(
              'echec internet',
              style: TextStyle(color: Colors.red),
            ));
      });
    } else {
      Get.back();

      Get.snackbar(
        '${tafsir.titre}',
        "telecharge",
        colorText: Colors.black,
        icon: Icon(
          Icons.download_done_rounded,
          color: Colors.green,
        ),
      );
    }
  }

  void isDownload() {
    listtafsir.forEach((ls) {
      downloadList.forEach((ds) {
        if (ls.titre == ds.titre) {
          listtafsir.remove(ls);
          listtafsir.add(ds);
        }
      });
    });
  }
}
