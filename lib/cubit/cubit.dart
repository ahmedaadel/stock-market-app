import 'package:borsetak/cubit/states.dart';
import 'package:borsetak/modules/Arba7_Screen.dart';
import 'package:borsetak/modules/Last_News.dart';
import 'package:borsetak/modules/Tawsyat.dart';
import 'package:borsetak/modules/segel_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(InitialState());
  static AppCubit get(context) =>BlocProvider.of(context);

  int currentIndex=0 ;
  List<Widget> navBarScreens= const [
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