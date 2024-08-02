import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/CreateChatController.dart';
import 'package:meetswap/App/Chat/View/CreateGroupChat/AddGroupNameView.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class AddMemberView extends GetView<CreateChatController> {
  const AddMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Column(
          children: [
            AppSize.sizedBox20,
            AppSize.sizedBox20,
            // AppSize.sizedBox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    )),
                Text(
                  "Add members",
                  style: TextStyle(fontSize: 20),
                ),
                Obx(
                  () => controller.selectedUsers.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            Get.to(() => AddGroupNameView(),
                                duration: Duration(milliseconds: 500),
                                transition: Transition.rightToLeftWithFade);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                        )
                      : SizedBox(
                          width: 50,
                        ),
                ),
              ],
            ),
            SearchContainer(
              onchange: (value) {},
            ),
            SizedBox(
              height: 85,
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.selectedUsers.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final int userId = controller.selectedUsers[index];
                    return SelctedUserWidget(
                      userId: userId,
                    );
                  },
                ),
              ),
            ),
            AppSize.sizedBox10,

            Expanded(
                child: ListView.builder(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
              itemCount: controller.allUsers.length,
              itemBuilder: (context, index) {
                final int userId = controller.allUsers[index];
                return UserCardAddToGroup(
                  userId: userId,
                );
              },
            )),

            Padding(
              padding: const EdgeInsets.all(AppSize.paddingElements12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share Invite Link",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  AppSize.sizedBox10,
                  Container(
                    padding: EdgeInsets.all(AppSize.paddingElements12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.yallow, width: 2),
                        color: AppColor.white.withOpacity(0.6)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ewdsadvuasdjbksad",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.asset(AppImagesPath.copyIcon)
                        ]),
                  ),
                  CustomeBtn(onTap: () {}, title: "Send Invitation"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(text: "Can't decide?", children: [
                        TextSpan(
                            text: " Skip for now",
                            style: TextStyle(
                                color: AppColor.blue,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("object");
                              })
                      ])),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserCardAddToGroup extends GetView<CreateChatController> {
  const UserCardAddToGroup({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!controller.selectedUsers.contains(userId)) {
          controller.selectedUsers.add(userId);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 6),
        padding: EdgeInsets.all(AppSize.paddingElements12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white.withOpacity(0.7)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
            ),
            AppSize.sizedBox10,
            Text(
              "Annie",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Expanded(child: AppSize.sizedBoxEmpty),
            Obx(
              () => Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: controller.selectedUsers.contains(userId)
                        ? AppColor.blue
                        : Colors.transparent,
                    border: controller.selectedUsers.contains(userId)
                        ? Border.all(width: 0, color: Colors.transparent)
                        : Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(50)),
                child: controller.selectedUsers.contains(userId)
                    ? Icon(
                        Icons.check,
                        color: AppColor.white,
                        size: 12,
                      )
                    : AppSize.sizedBoxEmpty,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelctedUserWidget extends GetView<CreateChatController> {
  const SelctedUserWidget({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSize.sizedBox20,
        Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      controller.selectedUsers.remove(userId);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 10,
                      child: Icon(
                        Icons.close,
                        color: AppColor.blue,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
                width: 70,
                child: Text(
                  "Annie",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ],
    );
  }
}
