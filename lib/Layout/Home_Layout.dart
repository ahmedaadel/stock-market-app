import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/Login/LoginCubit.dart';
import 'package:borsetak/modules/Login/LoginStates.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SvgPicture.asset(
        "assets/icons/icon_news.svg",
        height: getAppheight(context, 50),
        width: getAPPWidth(context, 50),
      ),
      SvgPicture.asset(
        "assets/icons/tawsyat.svg",
        height: getAppheight(context, 50),
        width: getAPPWidth(context, 50),
      ),
      SvgPicture.asset(
        "assets/icons/segel.svg",
        height: getAppheight(context, 50),
        width: getAPPWidth(context, 50),
      ),
      SvgPicture.asset(
        "assets/icons/arbah.svg",
        height: getAppheight(context, 50),
        width: getAPPWidth(context, 50),
      ),
    ];

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cub = LoginCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: blackColor,
            child: Scaffold(
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

              ),
              backgroundColor: Colors.white,
              body: cub.decideNavBar(user_satate)[cub.currentIndex],
              bottomNavigationBar: Theme(
                data: ThemeData(
                  iconTheme:
                      const IconThemeData(size: 30, color: Colors.white),
                ),
                child: CurvedNavigationBar(
                  animationDuration: const Duration(milliseconds: 300),
                  buttonBackgroundColor: defaultColor,
                  backgroundColor: Colors.white, //no change
                  color: blackColor,
                  index: cub.currentIndex,
                  onTap: (value) {
                    cub.changeBottomScreen(value);
                  },
                  items: items,
                  height: getAppheight(context, 60),
                ),
              ),
              drawer: Drawer(
                width: MediaQuery.of(context).size.width/2,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                        child:Container(color: Colors.grey, width:double.infinity,height: 10, )
                    ),
                    ListTile(
                      title: const Text(' تسجيل الخروج '),
                      onTap: () {
                        cub.signOut();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Item 2'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
