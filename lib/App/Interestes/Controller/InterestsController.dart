import 'package:get/get.dart';

import '../../SignUp/Models/InterestsModel.dart';

class InterestController extends GetxController {
  RxList<InterestsModel> allInterests = <InterestsModel>[].obs;
  RxList<InterestsModel> searchInterests = <InterestsModel>[].obs;
  RxList<int> addedInterestes = <int>[].obs;
  void onWhileSearching(String search) {
    if (search.isEmpty) {
      allInterests.value = InterestsModel.interestsList;
      searchInterests.value = InterestsModel.interestsList;
    } else {
      allInterests.value = searchInterests
          .where((element) =>
              element.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  void handelAddInterstes(int index) {
    if (addedInterestes.contains(index)) {
      addedInterestes.remove(index);
    } else {
      addedInterestes.add(index);
    }
  }

  @override
  void onInit() {
    allInterests.value = InterestsModel.interestsList;
    searchInterests.value = InterestsModel.interestsList;
    // TODO: implement onInit
    super.onInit();
  }
}
