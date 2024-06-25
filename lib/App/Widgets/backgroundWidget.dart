import 'package:flutter/material.dart';

import '../../Constant/Colors.dart';
import '../../Constant/Size.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      decoration:
          const BoxDecoration(gradient: AppColor.linearGradientBackground),
      child: child,
    );
  }
}
