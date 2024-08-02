import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Size.dart';

import 'ChatGroupCard.dart';

// ignore: must_be_immutable
class GroupOfGroupChat extends StatelessWidget {
  GroupOfGroupChat({super.key, required this.count, this.isTraning});
  final int count;
  List<bool>? isTraning = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width,
      child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
        for (int i = 0; i < count; i++)
          ChatGroupCard(
            istranding: isTraning == null
                ? false
                : isTraning!.isEmpty || isTraning!.length != count
                    ? false
                    : isTraning![i],
          ),
        // 1,
        //   2,
        //   3,
        //   4,
      ]
          //     .map(
          //       (e) =>
          //     )
          //     .toList(),
          ),
    );
  }
}
