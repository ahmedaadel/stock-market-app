import 'package:borsetak/Firebase_Auth/Auth.dart';
import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/Network/Local/Shared_preferences.dart';
import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/modules/Login/LoginStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool inAsyncCall =false ;

  void userLogin({required String email, required String password, required context}) async {
    emit(LoginLoadingState());
    await Auth.signIn(email: email, password: password).
    then((value) async {
      if (value != null) {
        await Cache_Helper.saveData(
            key: 'uid', value: value.uid)
            .then((value) {
              emit(LoginSuccessState());
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeLayout()));
        });
      }
    }).catchError((error) {showToast(
        text: error.toString(),
        state: ToastState.error);
      emit(LoginErrorState(error));});
  }



  void signUp({required String email, required String password, required context}) async{
    await Auth.signUp(
        email: email,
        password: password)
        .then((value) {
      if (value.user != null) {
        showToast(state: ToastState.success,text:'Account Created' );
        emit(SignUPSuccessState());
        Navigator.of(context).pop();
      }
    }).catchError((error){
      showToast(text: error.toString(), state: ToastState.error);
      emit(SignUPErrorState(error));
    });
  }


  void changeInAsynCall(bool state)
  {
    inAsyncCall =state ;
    emit(LoginIsAsycCallSuccessState());
  }



}
