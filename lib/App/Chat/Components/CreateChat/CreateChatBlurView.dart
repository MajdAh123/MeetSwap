import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/CreateChatController.dart';
import 'package:meetswap/App/Chat/View/CreateGroupChat/AddMembersView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class DialogCreatChatWithAnimtaion extends StatefulWidget {
  @override
  _DialogCreatChatWithAnimtaionState createState() =>
      _DialogCreatChatWithAnimtaionState();
}

class _DialogCreatChatWithAnimtaionState
    extends State<DialogCreatChatWithAnimtaion>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blurController = Get.find<BlurController>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(),
        backgroundColor: Colors.transparent,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 80),
          height: 200,
          // color: Colors.red,
          child: GetBuilder<BlurController>(
            init: blurController,
            builder: (controller) {
              return Opacity(
                opacity: _animationController.value,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOut,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.e,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Create group chat",
                            style:
                                TextStyle(fontSize: 18, color: AppColor.white),
                          ),
                          AppSize.sizedBox10,
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(() => AddMemberView(),
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.upToDown,
                                  binding: BindingsBuilder.put(
                                      () => CreateChatController()));

                              Get.find<BlurController>().resetController();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColor.orang,
                              child: Image.asset(AppImagesPath.usergroup),
                            ),
                          )
                        ],
                      ),
                      AppSize.sizedBox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Create personal chat",
                            style:
                                TextStyle(fontSize: 18, color: AppColor.white),
                          ),
                          AppSize.sizedBox10,
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColor.greenteal,
                            child: Image.asset(AppImagesPath.chatBubble),
                          )
                        ],
                      ),
                      AppSize.sizedBox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.find<BlurController>().resetController();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColor.white.withOpacity(0.7),
                              child: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
