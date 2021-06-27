import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:tafsir_app/controllers/home_controllers.dart';
import 'package:tafsir_app/data/tafsir_class.dart';

class PlayerController extends GetxController {
  /// slider value ///
  var sliderValue = 0.0.obs;

  final String album = "Riyaad Tafasir";

  final String artist = "Cheikh Youssoufou OUEDRAOGO";

  late PlayerState playerState;

  /// instance de AssetAudioPlayer ///
  final assetsAudioPlayer = AssetsAudioPlayer();

  /// choix de lecture en ligne ou local ///
  var isLocalFile = false.obs;

  /// list de audio ///
  List<Audio> audios = [];

  /// instance de homeController ///
  HomeController homeController = Get.find();

  /// methode de charge audio list ///
  void generateAudioList(List<Tafsir> tafsirs) {
    tafsirs.forEach(
      (element) {
        audios.add(
          Audio.network(
            element.path+'.mp3',
            cached: true,
            metas: Metas(
              title: element.titre,
              album: album,
              artist: artist,
              extra: {'duration': element.duration},
            ),
          ),
        );
        print(element.path);
      },
    );
  }

  /// play ///
  Future<void> play() async {
    try {
      assetsAudioPlayer.open(
        Playlist(audios: audios),
        showNotification: true,
        autoStart: false,
      );
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrr ${e.toString()}');
    }
  }

  Future<void> pause() async {
    if (playerState == PlayerState.play) assetsAudioPlayer.pause();
  }

  /// initialisation de assetaudioplayer ///
  void initialisation() {
    assetsAudioPlayer.playerState.listen((event) {
      playerState = event;
      print('playerstate event $event');
    });
  }

  @override
  void onInit() {
    // generateAudioList();
    initialisation();
    super.onInit();
  }
}
