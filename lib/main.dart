import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/Network/Local/Shared_preferences.dart';
import 'package:borsetak/Network/Remote/Dio_Helper.dart';
import 'package:borsetak/Shared/bloc_observer.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/cubit/cubit.dart';
import 'package:borsetak/cubit/states.dart';
import 'package:borsetak/modules/Admin/admin_home.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_Cubit.dart';
import 'package:borsetak/modules/Login/Login.dart';
import 'package:borsetak/modules/Login/LoginCubit.dart';
import 'package:borsetak/modules/Login/LoginStates.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Firebase.initializeApp();
  await Cache_Helper.init();
  userId = Cache_Helper.getData(key: 'uid');

  // Widget currentScreen = const  LoginScreen();
  // if(uid != null){
  //  currentScreen = const HomeLayout();
  // }
 DioHelper.initDio();
  runApp(const MyApp(currentScreen: HomeLayout()) );
}


class MyApp extends StatelessWidget {
  final Widget currentScreen ;
   const MyApp({super.key, required this.currentScreen});
  Future<FirebaseApp> initFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) =>  LoginCubit()),
        BlocProvider(create:(context) =>  AdminCubit()),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              theme: ThemeData(
                primaryColor: defaultColor,
                primarySwatch: Colors.lightGreen,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.black87),
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white,
                    systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.white ,statusBarIconBrightness: Brightness.dark ,statusBarBrightness: Brightness.dark),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
               /* bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.black54,
                  backgroundColor: Colors.grey[300],
                  elevation: 15,
                  selectedItemColor: defaultColor,
                  type: BottomNavigationBarType.fixed,
                  unselectedLabelStyle:
                  const TextStyle(decorationColor: Colors.black, fontSize: 16),
                  selectedLabelStyle:
                  const TextStyle(decorationColor: Colors.black, fontSize: 16),
                ),*/
              ),
              debugShowCheckedModeBanner: false,
              home:currentScreen
          );
        }
      ),
    );
  }
}
