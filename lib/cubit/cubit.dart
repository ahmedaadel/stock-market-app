import 'package:borsetak/cubit/states.dart';
import 'package:borsetak/modules/Arba7_Screen.dart';
import 'package:borsetak/modules/Last_News.dart';
import 'package:borsetak/modules/Tawsyat.dart';
import 'package:borsetak/modules/segel_Screen.dart';
import 'package:borsetak/modules/subsribed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/tawsyat_intro_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(InitialState());
  static AppCubit get(context) =>BlocProvider.of(context);

  int currentIndex=0 ;
  List<Widget> navBarScreens= const [
      LastNewsScreen(),
      TawsyatIntroScreen(),
      SegelScreen(),
      ArbahScreen()
  ];
  List<Widget> navBarScreens2= const [
    LastNewsScreen(),
    SubscribedScreen(),
    SegelScreen(),
    ArbahScreen()
  ];
  List<Widget> navBarScreens3= const [
    LastNewsScreen(),
    TawsyatScreen(),
    SegelScreen(),
    ArbahScreen()
  ];


  void changeBottomScreen(int index)
  {
    currentIndex= index ;
    emit(BottomNavBarState());
  }

}