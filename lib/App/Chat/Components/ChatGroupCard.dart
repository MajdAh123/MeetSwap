import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../Constant/ImagesPath.dart';

class ChatGroupCard extends StatelessWidget {
  const ChatGroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width * .47,
      height: AppSize.width * .4,
      margin: EdgeInsets.only(
          right: AppSize.width * .015,
          left: AppSize.width * .015,
          bottom: AppSize.width * .03),
      padding: EdgeInsets.all(AppSize.paddingElements12 * .7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white54),
      child: Column(
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
                  child: Stack(
                    children: [1, 2, 3, 4]
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
                  ),
                ),
                Text(
                  "20+",
                  style: TextStyle(color: Colors.black38),
                ),
                Expanded(
                    flex: 3,
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
    );
  }
}

List inters = [
  "",
  AppImagesPath.photographyIcon,
  AppImagesPath.musicIcon,
];
