
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/cubit/cubit.dart';
import 'package:borsetak/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cub = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: cub.navBarScreens[cub.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cub.currentIndex,
            onTap: (value){
              cub.changeBottomScreen(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: 'الاخبار '),
              BottomNavigationBarItem(icon: Icon(Icons.rate_review_rounded),label: 'السجل  '),
              BottomNavigationBarItem(icon: Icon(Icons.verified),label: 'التوصيات'),
              BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: 'الارباح'),
            ],
          ),
        );
      },
    );
  }
}
