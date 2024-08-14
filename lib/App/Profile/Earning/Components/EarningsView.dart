import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/ChatGroupCard.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/Constant/Size.dart';
import 'DialogEarningGroupCard.dart';
import 'MonetizedGroupCard.dart';

class EarningView extends StatelessWidget {
  const EarningView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AppSize.sizedBox20,
          const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
            child: Text(
              "MONETIZED GROUPS",
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
          ),
          AppSize.sizedBox10,
          SizedBox(
            height: AppSize.width * .4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const MonetizedGroupCard();
              },
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
            child: Text(
              "FREE GROUPS",
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
          ),
          AppSize.sizedBox10,
          Expanded(
            child: GridView.builder(
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final tapPosition = details.globalPosition;

                      Get.put<BlurController>(BlurController())
                          .startBlurAnimation();

                      Get.dialog(
                          useSafeArea: true,
                          DialogEarningsGroupCard(tapPosition: tapPosition));
                    },
                    child: ChatGroupCard());
              },
            ),
          ),
        ],
      ),
    );
  }
}
