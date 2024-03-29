import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/modules/Login/login_screen.dart';
import 'package:borsetak/modules/Login/subscribe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Shared/components/constants.dart';


class TawsyatIntroScreen extends StatelessWidget {
  const TawsyatIntroScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'التوصيات',
            style: TextStyle( fontSize: getAppSize(context, 25)),
          ),
          SizedBox(height:getAppheight(context, 15)),
          Center(child: SvgPicture.asset("assets/icons/53.svg",width: getAPPWidth(context, 240),height: getAppheight(context, 282),)),
          //Center(child: Image.asset("assets/images/intro2.png",width: getAPPWidth(context, 240),height: getAppheight(context, 282),))
          SizedBox(height:getAppheight(context, 24)),
          /*DefaultText(
          text: "شركة اليانز هي شركة تتميز بخبرة اكثر من 5 سنوات في مجال سوق الاسهم السعودية .",
          color: Color(0x80000000),
          font: "",
          font_size: getAppSize(context, 14.4),

        ),
        SizedBox(height:getAppheight(context, 19)),*/
          DefaultText(
            text: "من خلال هذا التطبيق تستطيع الشركة التواصل مع عملائها وابلاغهم بالتوصيات عن طريق اشعارات يتم ارسالها في الحال للحرص علي افادة عملائنا بكل الخدمات التي تقدمها الشركة .",
            color: Color(0x80000000),
            font: "",
            font_size: getAppSize(context, 14.4),

          ),
          SizedBox(height:getAppheight(context, 20)),
          Center(child: DefaultButton(
              context: context,
              height: 63.8,
              width: 307,
              radius: 12,
              color: Color(0xff8cd351),
              text: "اشترك معنا لتصلك توصياتنا",
              font_color: Colors.white,
              font_size: 18,
              onPressed: (){

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>SubscribeScreen()));
              }
          )
          ),
          SizedBox(height:getAppheight(context, 13)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(text:"هل انت عميل بالفعل؟",
                  color:Color(0x80000000),
                  font: "",
                  font_size: getAppSize(context, 13.5)
              ),
              TextButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginDraftScreen()));
              },
                child: Text("قم بتسجيل الدخول",
                  style: TextStyle(
                      color: Color(0xff296EBA),
                      fontSize: getAppSize(context, 14)

                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  
  }
}