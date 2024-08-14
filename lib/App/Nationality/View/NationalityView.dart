import 'package:country/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Nationality/Controller/NationalityController.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class NationalityView extends GetView<NationalityController> {
  const NationalityView({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                CustomeAppBar(title: "Nationality"),
                SearchContainer(
                  onchange: (value) {
                    controller.onWhileSearching(value);
                  },
                ),
                Expanded(
                    child: controller.allCountries.isEmpty
                        ? Center(
                            child: Text("No country found"),
                          )
                        : ListView.builder(
                            itemCount: controller.allCountries.length,
                            itemBuilder: (context, index) {
                              Country country = controller.allCountries[index];
                              if (country.nationality != "" ||
                                  country.ioc != null) {
                                return Obx(
                                  () => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: RadioListTile<Country>(
                                      activeColor: AppColor.teal,
                                      visualDensity: VisualDensity.comfortable,
                                      value: country,
                                      groupValue:
                                          controller.selectedNationlity.value,
                                      onChanged: (value) {
                                        controller.selectedNationlity.value =
                                            value!;
                                      },
                                      title: Row(
                                        children: [
                                          // Expanded(child: AppSize.sizedBoxEmpty),
                                          Expanded(
                                            child: Text(
                                              country.isoShortName,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          AppSize.sizedBox10,
                                          Text(
                                            country.flagEmoji,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return SizedBox();
                            },
                          )),
                CustomeBtn(onTap: onTap, title: "Ok")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
