import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Interestes/Controller/InterestsController.dart';
import 'package:meetswap/App/SignUp/Models/InterestsModel.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class InterestsView extends GetView<InterestController> {
  const InterestsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Column(
            children: [
              AppSize.sizedBox20,
              AppSize.sizedBox10,
              Padding(
                padding: const EdgeInsets.all(AppSize.paddingElements12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColor.white.withOpacity(0.6),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Interests",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.paddingElements12),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white.withOpacity(.8)),
                  child: TextField(
                    cursorHeight: 25,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: AppSize.paddingElements12),
                        prefixIcon: Image.asset(AppImagesPath.searchIcon),
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5))),
                    onChanged: (value) {
                      controller.onWhileSearching(value);
                      // controller.allCountries.value = controller.allCountries.where()
                    },
                  ),
                ),
              ),
              Expanded(
                  child: controller.allInterests.isEmpty
                      ? Center(
                          child: Text("No interests found"),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.paddingElements12),
                          itemCount: controller.allInterests.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            InterestsModel interestsModel =
                                controller.allInterests[index];
                            return Obx(
                              () => GestureDetector(
                                onTap: () => controller
                                    .handelAddInterstes(interestsModel.id),
                                child: Container(
                                  margin: EdgeInsets.all(
                                      AppSize.paddingElements12 / 2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: controller.addedInterestes
                                                  .contains(interestsModel.id)
                                              ? AppColor.teal
                                              : Colors.transparent,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context).cardColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(interestsModel.imagePath),
                                      AppSize.sizedBox10,
                                      Text(
                                        interestsModel.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                  //  ListView.builder(
                  //     itemCount: controller.allInterests.length,
                  //     itemBuilder: (context, index) {
                  //       Country country = controller.allCountries[index];
                  //       if (country.nationality != "" ||
                  //           country.ioc != null) {
                  //         return Obx(
                  //           () => Directionality(
                  //             textDirection: TextDirection.rtl,
                  //             child: RadioListTile<Country>(
                  //               activeColor: Colors.black,
                  //               visualDensity: VisualDensity.comfortable,
                  //               value: country,
                  //               groupValue:
                  //                   controller.selectedNationlity.value,
                  //               onChanged: (value) {
                  //                 controller.selectedNationlity.value =
                  //                     value!;
                  //               },
                  //               title: Row(
                  //                 children: [
                  //                   // Expanded(child: AppSize.sizedBoxEmpty),
                  //                   Expanded(
                  //                     child: Text(
                  //                       country.isoShortName,
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                       ),
                  //                       overflow: TextOverflow.ellipsis,
                  //                       textAlign: TextAlign.left,
                  //                     ),
                  //                   ),
                  //                   AppSize.sizedBox10,
                  //                   Text(
                  //                     country.flagEmoji,
                  //                     style: TextStyle(fontSize: 20),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       }
                  //       return SizedBox();
                  //     },
                  //   )
                  ),
              CustomeBtn(onTap: () {}, title: "Apply")
            ],
          ),
        ),
      ),
    );
  }
}
