import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Earning/Controller/EarningController.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Size.dart';

class SetGroupPriceView extends GetView<EarningsContoller> {
  const SetGroupPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomeAppBar(title: "Set Group Price"),
              AppSize.sizedBox20,
              TextFieldCustomeWidget(
                controller: controller.amountController.value,
                title: "Set an amount",
                hint: "AED",
                keyboardType: TextInputType.number,
                suffixIcon: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      "/mo",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Enter an amount for your group members to pay monthly",
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
              const Expanded(child: AppSize.sizedBoxEmpty),
              CustomeBtn(onTap: () {}, title: "Set Amount")
            ],
          ),
        ),
      ),
    );
  }
}
