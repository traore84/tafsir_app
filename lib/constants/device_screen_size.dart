import 'package:tafsir_app/controllers/home_controllers.dart';

/// methode de verification de la taille de l'ecran  ///
bool isSmallScreen(double deviceScreen) {
  if (deviceScreen <= 640) return true;
  return false;
}

HomeController homeController = HomeController.homeController;
