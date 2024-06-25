import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPageIndex = 2.obs;
  void hundlePage(int index) => currentPageIndex.value = index;
}
