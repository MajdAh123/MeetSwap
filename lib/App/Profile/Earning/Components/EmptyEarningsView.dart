import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:meetswap/App/Widgets/shiningEffectWidget.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class EmptyEarningsView extends StatelessWidget {
  const EmptyEarningsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.sizedBox20,
        AppSize.sizedBox20,
        ShiningWidget(
          maxSize: AppSize.width * 0.9,
          child: Image.asset(AppImagesPath.daimonedIcon),
        ),
        const SizedBox(
          width: 250,
          child: Text(
            "Create a group to start earning now!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
