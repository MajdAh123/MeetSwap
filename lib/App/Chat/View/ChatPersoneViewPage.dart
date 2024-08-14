import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/EmptyChatView.dart';
import 'package:meetswap/App/Chat/Components/ListOfMessageBubbleWidget.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/App/Widgets/userChatAppBarWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import '../Components/BottomBarChating/BottomBarWidget.dart';

class ChatPersonViewPage extends GetView<ChatController> {
  const ChatPersonViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        appBar: UserChatAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Obx(() => controller.isEmptyView.isTrue
                      ? EmptyChatPersonView()
                      : ListOfMessageBubbleWidget())),
              BottomCharBar()
            ],
          ),
        ),
      ),
    );
  }
}
