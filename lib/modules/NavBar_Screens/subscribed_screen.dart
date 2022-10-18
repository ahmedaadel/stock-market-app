
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Shared/components/constants.dart';

class SubscribedScreen extends StatelessWidget {
  const SubscribedScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
