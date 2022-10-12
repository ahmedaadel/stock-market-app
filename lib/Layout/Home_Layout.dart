
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/cubit/cubit.dart';
import 'package:borsetak/cubit/states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
              SvgPicture.asset("assets/icons/icon_news.svg",height: getAppheight(context,50),width: getAPPWidth(context, 50),),
             SvgPicture.asset("assets/icons/tawsyat.svg",height: getAppheight(context,50),width: getAPPWidth(context, 50),),
              SvgPicture.asset("assets/icons/segel.svg",height: getAppheight(context,50),width: getAPPWidth(context, 50),),
                SvgPicture.asset("assets/icons/arbah.svg",height: getAppheight(context,50),width: getAPPWidth(context, 50),),
              ];

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cub = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color:blackColor ,
            child: SafeArea(
              top: false,
              child: Scaffold(
                
                
                backgroundColor: Colors.white,
                body: cub.navBarScreens[cub.currentIndex],
            
                bottomNavigationBar: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(size:30,color: Colors.white),
                    

                    ),
                  child: CurvedNavigationBar(
                    animationDuration: Duration(milliseconds: 300),
                    buttonBackgroundColor: defaultColor,
                   backgroundColor: Colors.white,//no change
                   color: blackColor,
                    index: cub.currentIndex,
                    onTap: (value){
                      cub.changeBottomScreen(value);
                    },
                    items: items,
                    height: getAppheight(context,60),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
