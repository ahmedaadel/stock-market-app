
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Shared/components/constants.dart';

class SubscribedScreen extends StatelessWidget {
  const SubscribedScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          ' AlliaNz ',
          style: TextStyle(fontSize: getAppSize(context, 22),fontFamily: "ReemKufi",letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon:  Icon(IconlyBroken.notification, size: getAppSize(context, 24)))
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التوصيات',
              style: TextStyle( fontSize: getAppSize(context, 25)),
            ),
            SizedBox(height:getAppheight(context, 83)),
            Center(child: SvgPicture.asset("assets/icons/wait_for_us2.svg",height: getAppheight(context, 353),width: getAPPWidth(context, 298) ,),),
          ],
        ),
      ),
    );
  }
}
