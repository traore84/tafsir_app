import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/data/tafsir_class.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.find();

  /// list de tafsir from firebase ///
  RxList<Tafsir> listTafsirFromirebase = RxList<Tafsir>([]);

  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }

  /// fetch data from firebase ///
  void fetchDataFromFirebase() {
    FirebaseFirestore.instance
        .collection('TAFSIRS')
        .orderBy('titre')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listTafsirFromirebase.add(Tafsir.fromDocumentSnapshot(element));
      });
    });
  }
}
