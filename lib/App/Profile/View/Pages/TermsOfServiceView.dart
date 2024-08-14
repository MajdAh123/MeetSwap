import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:meetswap/Constant/policy.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            CustomeAppBar(title: "Terms Of Service"),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingElements12),
              itemCount: AppPolicy.termOfService.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(AppSize.paddingElements12),
                child: Text(
                  "${index + 1}. ${AppPolicy.termOfService[index]}",
                  style: TextStyle(fontSize: 17.5),
                ),
              ),
            ))
          ],
        )),
      ),
    );
  }
}
