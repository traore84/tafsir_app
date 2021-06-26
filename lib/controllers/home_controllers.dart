import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/data/tafsir_class.dart';

class HomeController extends GetxController {
  /// list de tafsir from firebase ///
  RxList<Tafsir> _listTafsirFromirebase = RxList<Tafsir>([]);

  @override
  void onInit() {
    fetchDataFromFirebase();
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
}
