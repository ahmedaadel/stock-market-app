import 'package:flutter/material.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ArbahScreen extends StatelessWidget {
  const ArbahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 5),
        child: Column(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('سجل الارباح ',
                  style: TextStyle(fontSize: 23, )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: const Text('من خلال التوصيات',
                  style: TextStyle(fontSize: 19,)),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: getAppheight(context, 280),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(" مجموع الأرباح هذا الشهر :",style: TextStyle(
                              fontSize: getAppSize(context, 20.6),
                              color: Colors.white
                            ),),
                          ],
                        )
                        ,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [

                              
                              Expanded(
                                child: Text('+18 %',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff1ED325),
                                        fontWeight: FontWeight.bold)),
                              ),

                              Expanded(
                                child: Text("2000.0",
                                    style: TextStyle(
                                        fontSize: getAppSize(context, 33.5),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(
                                height: getAppheight(context, 30),
                              ),

                              const Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 46,
                                  backgroundColor: defaultColor,
                                  child: Text('SAR',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.white,
                                          fontFamily: "ReemKufi")),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        Text("ريال سعودي ",
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: defaultColor,
                                          )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                  child: SvgPicture.asset("assets/images/Calculator.svg")
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    'assets/images/logo.png',
                    width: getAPPWidth(context, 88),
                    height: getAppheight(context, 84),
                     
                    
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'AlliaNz',
                    style: TextStyle(fontFamily: "ReemKufi", fontSize: 31),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  }

}
