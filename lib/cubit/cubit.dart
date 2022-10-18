// import 'package:borsetak/Network/Local/Shared_preferences.dart';
// import 'package:borsetak/Shared/components/constants.dart';
// import 'package:borsetak/cubit/states.dart';
// import 'package:borsetak/modules/NavBar_Screens/Arba7_Screen.dart';
// import 'package:borsetak/modules/NavBar_Screens/Last_News.dart';
// import 'package:borsetak/modules/NavBar_Screens/Tawsyat.dart';
// import 'package:borsetak/modules/NavBar_Screens/segel_Screen.dart';
// import 'package:borsetak/modules/NavBar_Screens/subscribed_screen.dart';
// import 'package:borsetak/modules/NavBar_Screens/tawsyat_intro_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() :super(InitialState());
//   static AppCubit get(context) =>BlocProvider.of(context);
//
//   int currentIndex=0 ;
//   List<Widget> navBarScreens= const [
//       LastNewsScreen(),
//       TawsyatIntroScreen(),
//       SegelScreen(),
//       ArbahScreen()
//   ];
//   List<Widget> navBarScreens2= const [
//     LastNewsScreen(),
//     SubscribedScreen(),
//     SegelScreen(),
//     ArbahScreen()
//   ];
//   List<Widget> navBarScreens3= const [
//     LastNewsScreen(),
//     TawsyatScreen(),
//     SegelScreen(),
//     ArbahScreen()
//   ];
//
//   List decideNavBar(int userState)
//   {
//     if(userId != null)
//     {return navBarScreens3;}
//     if (userState == 1) {
//       return navBarScreens;
//     } else if (userState == 2) {
//       return navBarScreens2;
//     } else {
//       return navBarScreens3;
//     }
//   }
//   void changeBottomScreen(int index)
//   {
//     currentIndex= index ;
//     emit(BottomNavBarState());
//   }
//
//
//   Future<void> signOut()  async {
//     FirebaseAuth.instance.signOut().
//     then((value) {
//       Cache_Helper.removeData(key: 'uid');
//       user_satate=1 ;
//       emit(SignOutSuccessState());
//     }).catchError((error){
//       print(error);
//       emit(SignOutSuccessState());
//     });
//
//
//   }
//
// }