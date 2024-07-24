import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class NotifcationCardView extends StatelessWidget {
  const NotifcationCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          TitleTextWidget(
            title: "Today",
          ),
          ...[
            for (int i = 0; i < 2; i++) NotificationCard(),
          ],
          TitleTextWidget(
            title: "this week",
          ),
          ...[
            for (int i = 0; i < 1; i++) NotificationCard(),
          ],
          TitleTextWidget(
            title: "this month",
          ),
          ...[
            for (int i = 0; i < 1; i++) NotificationCard(),
          ],
          TitleTextWidget(
            title: "earlier",
          ),
          ...[
            for (int i = 0; i < 10; i++) NotificationCard(),
          ],
        ],
      ),
    ));
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.sizedBox10,
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
          child: Row(
            children: [
              AppSize.sizedBox20,
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: AppSize.width * .9,
      padding: EdgeInsets.all(AppSize.paddingElements12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColor.white.withOpacity(0.65)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
            ),
            AppSize.sizedBox10,
            Expanded(
              child: RichText(
                maxLines: 5,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Merari.perry ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "sent you a chat request.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: " 2m",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppSize.sizedBox10,
            GestureDetector(
              onTap: onTap ?? () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSize.paddingElements12 / 1.5,
                    horizontal: AppSize.paddingElements12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColor.primaryColor.withOpacity(0.2)),
                child: Row(
                  children: [
                    Text(
                      "View",
                      style: TextStyle(fontSize: 12, color: Colors.blue[400]),
                    ),
                    AppSize.sizedBox5,
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                      color: Colors.blue[400],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
