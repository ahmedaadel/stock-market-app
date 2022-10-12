import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/modules/Admin/add_tawsya.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/components/constants.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        
        appBar: AppBar(
          title: Center(
            child: Text("AlliaNz",
            style: TextStyle(
              color: Colors.black,
              fontSize: getAppSize(context, 22),
              fontFamily: "ReemKufi"
            ),),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 25),
            child: Column(
              children: [
                Container(
                
                height:getAppheight(context,112),
                width: getAPPWidth(context, 310),

                decoration: BoxDecoration(
                   color: Color(0xff353535),
                   borderRadius: BorderRadius.circular(12)
                ),
                child: MaterialButton(
                  onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) =>AddTawsyaScreen()));},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "اضافة توصية",
                        style: TextStyle(
                         fontSize:getAppSize(context,30),
                         color: Colors.white,
                         
                        ),
                      ),
                      SizedBox(
                          width: getAPPWidth(context, 22),
                    
                        ),
                        SvgPicture.asset(
                          "assets/icons/stock.svg",height: getAppheight(context, 54),width: getAPPWidth(context, 54),
                        )
                    ],
                  ),
                ),
                  
                ),
                SizedBox(
                  height: getAppheight(context, 47.5),
                ),
                Container(
                
                height:getAppheight(context,112),
                width: getAPPWidth(context, 310),

                decoration: BoxDecoration(
                   color: Color(0xff618985),
                   borderRadius: BorderRadius.circular(12)
                ),
                child: MaterialButton(
                  onPressed: (){
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "اضافة خبر",
                        style: TextStyle(
                         fontSize:getAppSize(context,30),
                         color: Colors.white,
                         
                        ),
                      ),
                      SizedBox(
                          width: getAPPWidth(context, 22),
                    
                        ),
                        SvgPicture.asset(
                          "assets/icons/stock.svg",height: getAppheight(context, 54),width: getAPPWidth(context, 54),
                        )
                    ],
                  ),
                ),
                  
                )
    
    
              ],
            ),
          )
        ),
      ),
    );
    
  }
}