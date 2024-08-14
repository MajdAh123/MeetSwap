import 'package:flutter/material.dart';
import 'package:meetswap/App/Widgets/FireAnimationEffect.dart';
import 'package:meetswap/Constant/Size.dart';
import '../../../Constant/ImagesPath.dart';

class ChatGroupCard extends StatelessWidget {
  const ChatGroupCard(
      {super.key, this.istranding = false, this.isInDialog = false});
  final bool istranding;
  final bool isInDialog;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width * .47,
      height: AppSize.width * .4,
      margin: isInDialog
          ? EdgeInsets.zero
          : EdgeInsets.only(
              right: AppSize.width * .015,
              left: AppSize.width * .015,
              bottom: AppSize.width * .03),
      padding: EdgeInsets.all(AppSize.paddingElements12 * .7),
      decoration: BoxDecoration(
          image: istranding
              ? DecorationImage(
                  image: AssetImage(
                    AppImagesPath.backgroundGroupCard,
                  ),
                  fit: BoxFit.fill)
              : null,
          // gradient: istranding
          //     ? RadialGradient(
          //         // stops: [10, 1],
          //         // transform: ,
          //         radius: 0.4,
          //         center: Alignment.center,
          //         focalRadius: 0.6,
          //         focal: Alignment.center,
          //         colors: [
          //             Color.fromARGB(30, 255, 106, 0),
          //             // Color.fromARGB(158, 236, 82, 70),
          //             Colors.white54,
          //           ])
          //     : null,
          borderRadius: BorderRadius.circular(25),
          color: Colors.white54),
      child: Stack(
        children: [
          Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AppImagesPath.groupChatImage),
                  ),
                  AppSize.sizedBox10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Football",
                        // style: TextStyle(fontWeig),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "12 members typing...",
                        style: TextStyle(fontSize: 8, color: Colors.black26),
                      )
                    ],
                  ),
                ],
              ),
              AppSize.sizedBox5,
              Expanded(
                  flex: 2,
                  child: Text(
                    "Here could be a little description about the chatroom...",
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )),
              AppSize.sizedBox5,
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(children: [
                        ...[1, 2, 3, 4]
                            .map((e) => Positioned(
                                  bottom: 0,
                                  left: [1, 2, 3, 4].indexOf(e).toDouble() * 15,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            AppImagesPath.userBotBarIcon),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        Positioned(
                          bottom: 0,
                          left: 75,
                          child: Text(
                            "20+",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ]),
                    ),
                    Expanded(
                        flex: 2,
                        child: Stack(
                          children: inters.map((e) {
                            int i = inters.indexOf(e);
                            return Positioned(
                              right: i.toDouble() * 15,
                              bottom: 0,
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                child: inters.first == e
                                    ? Text(
                                        "+1",
                                        style: TextStyle(
                                            fontSize: 9, color: Colors.black54),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(e),
                                      ),
                              ),
                            );
                          }).toList(),
                        ))
                  ],
                ),
              )
            ],
          ),
          if (istranding)
            Positioned(
              bottom: 0,
              right: 0,
              child: BurningEffect(
                isRun: istranding,
              ),
            ),
        ],
      ),
    );
  }
}

List inters = [
  "",
  AppImagesPath.photographyIcon,
  AppImagesPath.musicIcon,
];
