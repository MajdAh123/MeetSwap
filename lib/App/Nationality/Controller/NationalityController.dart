import 'package:country/country.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NationalityController extends GetxController {
  RxList<Country> allCountries = <Country>[].obs, searchList = <Country>[].obs;
  // ignore: prefer_typing_uninitialized_variables
  Rx<Country> selectedNationlity = Countries.are.obs;
  // Rx<Country> selectedNationlityProfile = Countries.are.obs;
  final box = GetStorage();
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

  saveSelectedCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("countryCode", selectedNationlity.value.countryCode);
    // box.write("Nationality", Country.);
  }

  getSelectedCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    selectedNationlity.value = allCountries
        .where(
            (p0) => p0.countryCode == (prefs.getString("countryCode") ?? "971"))
        .first;
  }

  @override
  void onInit() {
    allCountries.value = Countries.values;
    searchList.value = Countries.values;
    getSelectedCountry();
    // print(allCountries
    //     .where((p0) => p0.countryCode == "971")
    //     .toList()[0]
    //     .isoShortName);
    // TODO: implement onInit
    super.onInit();
  }
}
