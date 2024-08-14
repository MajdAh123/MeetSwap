import 'package:flutter/material.dart';
import 'package:meetswap/App/Notifcation/View/NotificationViews/NotifcationCardView.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';

import 'NotificationViews/EmptyNotificationView.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomeAppBar(title: "Notifications"),
              // EmptyNotificationView(),
              NotifcationCardView()
            ],
          ),
        ),
      ),
    );
  }
}
