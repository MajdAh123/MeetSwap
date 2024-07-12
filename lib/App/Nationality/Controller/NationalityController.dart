import 'package:country/country.dart';
import 'package:get/get.dart';

class NationalityController extends GetxController {
  RxList<Country> allCountries = <Country>[].obs, searchList = <Country>[].obs;
  // ignore: prefer_typing_uninitialized_variables
  Rx<Country> selectedNationlity = Countries.are.obs;
  void onWhileSearching(String search) {
    if (search.isEmpty) {
      allCountries.value = Countries.values;
      searchList.value = Countries.values;
    } else {
      allCountries.value = searchList
          .where((element) =>
              element.isoShortName.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    allCountries.value = Countries.values;
    searchList.value = Countries.values;
    // print(allCountries.where((p0) => p0.countryCode == "971"));
    // TODO: implement onInit
    super.onInit();
  }
}
