import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Size.dart';

import 'MessageBubble.dart';

class ListOfMessageBubbleWidget extends StatelessWidget {
  const ListOfMessageBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
      children: [
        // AppSize.sizedBox20,
        MessageBubble(
          isMe: false,
          uniqKey: UniqueKey(),
        ),
        MessageBubble(
          isMe: true,
          uniqKey: UniqueKey(),
        ),
      ],
    );
  }
}
