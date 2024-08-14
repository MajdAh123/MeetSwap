import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Earning/Controller/EarningController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<EarningsContoller>(EarningsContoller());
    print("asdasd");
  }
}
