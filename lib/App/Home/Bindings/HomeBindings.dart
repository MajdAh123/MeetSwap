import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';
import 'package:meetswap/App/Profile/Controller/profileController.dart';

import '../../Gate/Controller/GateController.dart';
import '../../Interestes/Controller/InterestsController.dart';
import '../../Lobby/Controller/LobbyController.dart';
import '../../Nationality/Controller/NationalityController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(ChatController(), permanent: true);
    Get.put<HomePageController>(HomePageController(), permanent: true);
    Get.put<GateController>(GateController(), permanent: true);
    Get.put<LobbyController>(LobbyController(), permanent: true);
    Get.put<ProfileController>(ProfileController(), permanent: true);

    Get.lazyPut<NationalityController>(() => NationalityController(),
        fenix: true);
    Get.lazyPut<InterestController>(() => InterestController(), fenix: true);

    // TODO: implement dependencies
  }
}
