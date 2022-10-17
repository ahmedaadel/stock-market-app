

import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/subsribed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscribeScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:20,left:20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset("assets/icons/subscribe.svg",width:getAPPWidth(context, 338.83) ,height: getAppheight(context,232.37),),
              SizedBox( height: getAppheight(context, 28),),
                Row(
                  children: [
                    DefaultText(
                      text: "اشترك معنا",
                      color: Colors.black,
                      font: "",
                      font_size: getAppSize(context, 30),
                    ),
                    Expanded(child: SizedBox(width: 0,)),
                    SvgPicture.asset("assets/icons/logo.svg",width:getAPPWidth(context, 69) ,height: getAppheight(context,59.2),)

                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(

                    children: [
                      DefaultTextForm(validationFun: (value)
                      {
                        if(value==null||value.isEmpty){
                          return "هذا الحقل مطلوب";
                        }
                        return null;

                      },
                          controller: nameController,
                          labelText: "الاسم",
                      fontsize: getAppSize(context, 15)
                      ),
                      DefaultTextForm(validationFun: (value)
                      {
                        if(value==null||value.isEmpty){
                          return "هذا الحقل مطلوب";
                        }
                        return null;

                      },
                        controller: phoneController,
                        labelText: "رقم الهاتف",
                        fontsize: getAppSize(context, 14),
                        keyboardType: TextInputType.phone,
                      ),
                      DefaultTextForm(validationFun: (value)
                      {
                        if(value==null||value.isEmpty){
                          return "هذا الحقل مطلوب";
                        }
                        return null;

                      },
                          controller: emailController,
                          labelText: "البريد الالكتروني",
                          fontsize: getAppSize(context, 15),
                        keyboardType: TextInputType.emailAddress
                      ),
                      SizedBox(height:getAppheight(context, 29)),
                      DefaultButton(context: context,height: getAppheight(context, 64),
                          width: getAPPWidth(context, 306),
                          radius: 12,
                          color: Color(0xff353535),
                          text: "اشتراك",
                          font_color: Colors.white,
                          font_size: getAppSize(context, 32),
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              print("object");
                              user_satate=2;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>HomeLayout()));
                            }
                          }
                      ),
                      SizedBox(height:getAppheight(context, 10)),
                      DefaultText(
                        text: "بمجرد الضغط علي زر الاشتراك سوف يتم التواصل معك\nمن قبل احد عملائنا في اسرع وقت",
                        color: Color(0x80000000),font_size: getAppSize(context, 14),font: ""
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
