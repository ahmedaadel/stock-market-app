
import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:borsetak/modules/Login/LoginStates.dart';
import 'package:borsetak/modules/Login/LoginCubit.dart';


class LoginDraftScreen extends StatefulWidget {
  @override
  State<LoginDraftScreen> createState() => _LoginDraftScreenState();
}

class _LoginDraftScreenState extends State<LoginDraftScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isSecure=true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cube = LoginCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Center(child: DefaultText(text:"AlliaNz",color: Colors.black,font_size:getAppSize(context, 22))),
            ),
            body:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,right: 20,left: 20),
                child: Column(
                  children: [
                    DefaultText(
                      text: "تسجيل الدخول",color: Colors.black,font: "",font_size: getAppSize(context, 22),
                    ),
                    SizedBox( height:getAppheight(context, 61)),

                    SvgPicture.asset("assets/icons/logo.svg",height: getAppheight(context, 128),width: getAPPWidth(context, 138),),
                    SizedBox( height:getAppheight(context, 63)),
                    Form(
                        key: _formKey,
                        child:Column(
                          children: [
                            DefaultTextFormWithIcons(validationFun: (value)
                            {
                              if(value==null||value.isEmpty){
                                return "هذا الحقل مطلوب";
                              }
                              return null;

                            }, controller: emailController,
                              labelText: "البريد الالكتروني",
                              fontsize: getAppSize(context, 16.7),
                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                            SizedBox( height:getAppheight(context, 68)),


                            DefaultTextFormWithIcons(validationFun: (value)
                            {
                              if(value==null||value.isEmpty){
                                return "هذا الحقل مطلوب";
                              }
                              return null;

                            }, controller: passwordController,
                                labelText: "كلمة المرور ",
                                fontsize: getAppSize(context, 16.7),
                                prefixIcon: Icon(Icons.key ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isSecure = !isSecure;
                                      });
                                    },
                                    icon: isSecure ? Icon(Icons.visibility_sharp,): Icon(Icons.visibility_off)
                                ),
                                secure: isSecure
                            ),

                            SizedBox( height:getAppheight(context, 70)),
                            DefaultButton(context: context,
                                height: 54,
                                width: 247,
                                radius: 20,
                                color: Color(0xff8cd351),
                                text: "تسجيل الدخول",
                                font_color: Colors.white,
                                font_size: getAppSize(context, 18),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cube.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context);
                                  }
                                }
                            ),

                          ],
                        ))

                  ],
                ),
              ),
            ) ,
          ),
        );
      },
    );

}
  }

