import 'package:borsetak/Firebase_Auth/Auth.dart';
import 'package:borsetak/Network/Local/Shared_preferences.dart';
import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/models/UserModel.dart';
import 'package:borsetak/modules/Admin/admin_home.dart';
import 'package:borsetak/modules/Login/LoginStates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/NavBar_Screens/Arba7_Screen.dart';
import 'package:borsetak/modules/NavBar_Screens/Last_News.dart';
import 'package:borsetak/modules/NavBar_Screens/Tawsyat.dart';
import 'package:borsetak/modules/NavBar_Screens/segel_Screen.dart';
import 'package:borsetak/modules/NavBar_Screens/subscribed_screen.dart';
import 'package:borsetak/modules/NavBar_Screens/tawsyat_intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool inAsyncCall = false;
  void userLogin
      (
      {required String email, required String password, required context}) async
  {
    emit(LoginLoadingState());
    await Auth.signIn(email: email, password: password).then((value) async {
      if (value != null)
      {
         userId = value.uid;
        await Cache_Helper.saveData(key: 'uid', value:userId).then((value) {
          emit(UserLoginLoadingState());
           FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get()
              .then((value) {
                UserModel userModel=UserModel.fromJson(value.data());
                if(userModel.role =='user')
                  {
                    decideNavBar(3);
                    Navigator.of(context).pop();
                    emit(LoginSuccessState());
                  }
                else if(userModel.role =='admin')
                  {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AdminHomeScreen()));
                    emit(LoginSuccessState());
                  }
          });
        });
      }
    }).catchError((error) {
      showToast(text: error.toString(), state: ToastState.error);
      emit(LoginErrorState(error));
    });
  }

  void signUp(
      {required String email,
      required String password,
      required context,
      required String name}) async {
    await Auth.signUp(email: email, password: password).then((value) {
      if (value.user != null) {
        addUserToDataBase(email: email, name: name, uId: value.user!.uid)
            .then((value) {
          showToast(state: ToastState.success, text: 'Account Created');
          emit(SignUPSuccessState());
          Navigator.of(context).pop();
        });
      }
    }).catchError((error) {
      showToast(text: error.toString(), state: ToastState.error);
      emit(SignUPErrorState(error));
    });
  }

  void changeInAsynCall(bool state) {
    inAsyncCall = state;
    emit(LoginIsAsycCallSuccessState());
  }

  Future<void> addUserToDataBase(
      {required String email, required String name, required String uId}) async
  {
    UserModel newUser = UserModel(name: name, email: email, role: 'user');
    return await FirebaseFirestore.instance
        .collection('users').doc(uId).set(newUser.toMap())
        .then((value) {
      emit(AddUserToDataBaseSuccessState());
    }).catchError((error)
    {
      print(error);
      emit(AddUserToDataBaseErrorState());
    });
  }

  ////////// OLD APP CUBIT

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

  List decideNavBar(int userState)
  {
    if(userId != null)
    {return navBarScreens3;}
    if (userState == 1) {
      return navBarScreens;
    } else if (userState == 2) {
      return navBarScreens2;
    } else {
      return navBarScreens3;
    }
  }
  void changeBottomScreen(int index)
  {
    currentIndex= index ;
    emit(BottomNavBarState());
  }


  Future<void> signOut()  async {
    FirebaseAuth.instance.signOut().
    then((value) async{
      await Cache_Helper.removeData(key: 'uid').then((value) {
        userId=null;
        decideNavBar(1);
        emit(SignOutSuccessState());
      }).catchError((error)
      {print('error on cache helper');
        print(error);
        emit(SignOutSuccessState());});
    }).catchError((error){
      print(error);
      emit(SignOutSuccessState());
    });


  }

}
