import 'package:borsetak/Firebase_Auth/Auth.dart';
import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/Network/Local/Shared_preferences.dart';
import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/models/News_Model.dart';
import 'package:borsetak/models/UserModel.dart';
import 'package:borsetak/models/tawsya_Model.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminStates>{
  AdminCubit():super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  void addTawsya({required String sahm,required String description
    ,required String priceBefore,required String priceAfter})
  {
    emit(AdminaddTawsyaLoadingState());
    tewsyaModel Taw = tewsyaModel(description: description,priceAfter: priceBefore,priceBefore: priceAfter,sahm: sahm);
    FirebaseFirestore.instance
        .collection('tawsya')
        .add(Taw.toMap()).
    then((value) {
      print('Done');
      emit(AdminaddTawsyaSuccessState());
      showToast(text: 'Done', state: ToastState.success);
    }).
    catchError((error){
      print(error.toString());
      showToast(text: error.toString(), state: ToastState.error);
      emit(AdminaddTawsyaErrorState());
    });
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



  void addNews({required String sahm,required String description
    ,required String priceBefore,required String priceAfter})
  {
    emit(AdminaddTawsyaLoadingState());
    tewsyaModel Taw = tewsyaModel(description: description,priceAfter: priceBefore,priceBefore: priceAfter,sahm: sahm);
    FirebaseFirestore.instance
        .collection('news')
        .add(Taw.toMap()).
    then((value) {
      print('Done');
      emit(AdminaddTawsyaSuccessState());
      showToast(text: 'Done', state: ToastState.success);
    }).
    catchError((error){
      print(error.toString());
      showToast(text: error.toString(), state: ToastState.error);
      emit(AdminaddTawsyaErrorState());
    });
  }



  Future<void> signOut(context)  async {
    FirebaseAuth.instance.signOut().
    then((value) async{
      await Cache_Helper.removeAllData().then((value) {
        userId=null;
        role=null;
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) =>const HomeLayout(),), (route) => false);
        emit(SignOutSuccessState());
      }).catchError((error)
      {print('error on cache helper');
      print(error);
      emit(SignOutErrorState());});
    }).catchError((error){
      print(error);
      emit(SignOutErrorState());
    });
  }




  Future<void> addNewsToDataBase(
      {required String news, required String dateTime}) async
  {
    NewsModel newsModel = NewsModel(news: news, dateTime: dateTime);
    return await FirebaseFirestore.instance
        .collection('news').add(newsModel.toMap())
        .then((value) {
      showToast(text: 'تم اضافه الخبر بنجاح', state: ToastState.success );
      emit(AdminAddNewsToDBSuccessState());
    }).catchError((error)
    {
      print(error);
      showToast(text: 'حدث خطا ما ', state: ToastState.error );
      emit(AdminAddNewsToDBErrorState());
    });
  }


}