import 'package:get/get.dart';
import '../../SignUp/Models/InterestsModel.dart';
import '../Components/MassageRequestBottomSheet.dart';

class LobbyController extends GetxController {
  // List
  RxBool isLobbyEmpty = true.obs;
  RxInt filterGender = 0.obs;
  RxDouble filterStartAge = 24.00.obs;
  RxDouble filterEndAge = 46.00.obs;
  var isDialogOpen = false.obs;
  var reportReason = "".obs;
  void showChatRequst() {
    Get.bottomSheet(const MassageRequestBottomSheet());
  }

  void openDialog() {
    isDialogOpen.value = true;
  }

  void closeDialog() {
    isDialogOpen.value = false;
  }
}
