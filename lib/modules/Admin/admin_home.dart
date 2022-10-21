import 'package:borsetak/modules/Admin/add_client.dart';
import 'package:borsetak/modules/Admin/add_khabar.dart';
import 'package:borsetak/modules/Admin/add_tawsya.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_Cubit.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/components/constants.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "AlliaNz",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getAppSize(context, 22),
                    fontFamily: "ReemKufi"),
              ),
              leading: IconButton(onPressed: (){AdminCubit.get(context).signOut(context);},
                  icon:const Icon(Icons.logout)),
            ),
            body: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                  child: Column(
                    children: [
                      Container(
                        height: getAppheight(context, 112),
                        width: getAPPWidth(context, 310),
                        decoration: BoxDecoration(
                            color: Color(0xff353535),
                            borderRadius: BorderRadius.circular(12)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTawsyaScreen()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اضافة توصية",
                                style: TextStyle(
                                  fontSize: getAppSize(context, 30),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: getAPPWidth(context, 22),
                              ),
                              SvgPicture.asset(
                                "assets/icons/stock.svg",
                                height: getAppheight(context, 54),
                                width: getAPPWidth(context, 54),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getAppheight(context, 47.5),
                      ),
                      Container(
                        height: getAppheight(context, 112),
                        width: getAPPWidth(context, 310),
                        decoration: BoxDecoration(
                            color: const Color(0xff618985),
                            borderRadius: BorderRadius.circular(12)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddNewsScreen()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اضافة خبر",
                                style: TextStyle(
                                  fontSize: getAppSize(context, 30),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: getAPPWidth(context, 22),
                              ),
                              SvgPicture.asset(
                                "assets/icons/stock.svg",
                                height: getAppheight(context, 54),
                                width: getAPPWidth(context, 54),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getAppheight(context, 47.5),
                      ),
                      Container(
                        height: getAppheight(context, 112),
                        width: getAPPWidth(context, 310),
                        decoration: BoxDecoration(
                            color: Color(0xff353535),
                            borderRadius: BorderRadius.circular(12)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddClientScreen()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اضافة عميل",
                                style: TextStyle(
                                  fontSize: getAppSize(context, 30),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: getAPPWidth(context, 22),
                              ),
                              SvgPicture.asset(
                                "assets/icons/stock.svg",
                                height: getAppheight(context, 54),
                                width: getAPPWidth(context, 54),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
