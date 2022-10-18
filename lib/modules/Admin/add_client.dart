import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_Cubit.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signEmailCtr = TextEditingController();
    var signPassCtr = TextEditingController();
    var signPassCtr2 = TextEditingController();
    var formKey2 = GlobalKey<FormState>();
    var username = TextEditingController();



    String? validationFun(value, String msg) {
      if (value!.isEmpty) {
        return msg;
      }
      return null;
    }

    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cube = AdminCubit.get(context);
        return  Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.only(left: getAPPWidth(context, 50)),
                child: Center(
                  child: DefaultText(
                    text: "AlliaNz",
                    font_size: getAppSize(context, 22),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                DefaultText(
                  text: "اضافة توصية",
                  font: "",
                  font_size: getAppSize(context, 23.75),
                ),
                SizedBox(
                  height: getAppheight(context, 8),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff353535),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))
                    ),
                    padding:const  EdgeInsets.all( 10),
                    child: Form(
                      key: formKey2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 25,),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                child: textForm(
                                    suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.supervised_user_circle)),
                                    validationFun: (value) => validationFun(
                                        value, 'Ur name can not be empty'),
                                    controller: username,
                                    hintText: 'User name'),
                              )),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: textForm(
                                    suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.email)),
                                    validationFun: (value) => validationFun(
                                        value, 'Email address can not be empty'),
                                    controller: signEmailCtr,
                                    hintText: 'Email'),
                              )),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: textForm(
                                    suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.lock)),
                                    validationFun: (value) => validationFun(
                                        value, 'password can not be empty'),
                                    controller: signPassCtr,
                                    hintText: 'Password',
                                    secure: true),
                              )),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: textForm(
                                    suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.lock)),
                                    validationFun: (value) {
                                      if (value!.isEmpty) {
                                        return 'password can not be empty';
                                      }
                                      if (signPassCtr.text != signPassCtr2.text) {
                                        return 'You must write the same password twice';
                                      }
                                      if (signPassCtr.text == signPassCtr2.text) {
                                        return null;
                                      }
                                    },
                                    controller: signPassCtr2,
                                    hintText: 'Confirm  Password',
                                    secure: true),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey2.currentState!.validate()) {
                                  cube.signUp(
                                      email: signEmailCtr.text,
                                      password: signPassCtr2.text,
                                      context: context,name:username.text);
                                } else {
                                  showToast(
                                      text: 'Some Thing Went Wrong',
                                      state: ToastState.error);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  backgroundColor: defaultColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child:const
                              Text('sign up', style: TextStyle(fontSize: 17)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
