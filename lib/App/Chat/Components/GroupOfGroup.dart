import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Size.dart';

import 'ChatGroupCard.dart';

class GroupOfGroupChat extends StatelessWidget {
  const GroupOfGroupChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [1, 2, 3, 4]
            .map(
              (e) => ChatGroupCard(),
            )
            .toList(),
      ),
    );
  }
}
