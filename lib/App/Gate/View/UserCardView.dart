import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Gate/Controller/GateController.dart';
import '../../../Constant/ImagesPath.dart';
import '../../../Constant/Size.dart';
import '../../Home/Components/UserImageTopBar.dart';
import '../Components/CardShap.dart';

class UserCardView extends GetView<GateController> {
  const UserCardView({super.key});
  @override
  Widget build(BuildContext context) {
    List<CustomShapeCard> cards = [
      CustomShapeCard(
        username: 'Jenny',
        age: 25,
        country: 'Spain',
        description:
            'Heyyy I\'m a foodie on a mission to find the best local eats!',
        interests: const [
          AppImagesPath.foodIcon,
          AppImagesPath.musicIcon,
          AppImagesPath.photographyIcon
        ],
      ),
      CustomShapeCard(
        username: 'Mike',
        age: 30,
        country: 'USA',
        description: 'Love to travel and explore new places!',
        interests: const [
          AppImagesPath.eventsIcon,
          AppImagesPath.sportIcon,
          AppImagesPath.musicIcon
        ],
      ),
      // Add more CustomShapeCard instances here...
    ];

    return Stack(
      children: [
        Positioned(
            right: 0,
            top: 40,
            child: Image.asset(AppImagesPath.swippingBackground)),
        Column(children: [
          AppSize.sizedBox20,
          InkWell(
              onTap: () {
                controller.changeViewing();
              },
              child: UserImageTopBar()),
          Obx(
            () => Expanded(
              child: CardSwiper(
                padding: EdgeInsets.all(0),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) =>
                    cards[index],
                cardsCount: cards.length,
                numberOfCardsDisplayed: 1,
                controller: controller.cardSwiperController.value,
                onSwipe: (previousIndex, currentIndex, direction) =>
                    controller.resetCountDown(),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
