import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/cubit/cubit.dart';
import 'package:borsetak/cubit/states.dart';
import 'package:borsetak/modules/Last_News.dart';
import 'package:borsetak/modules/Login.dart';
import 'package:borsetak/modules/Tawsyat.dart';
import 'package:borsetak/modules/segel_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<FirebaseApp> initFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
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
                  SystemUiOverlayStyle(statusBarColor: Colors.white),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.black54,
            backgroundColor: Colors.grey[300],
            elevation: 15,
            selectedItemColor: defaultColor,
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle:
                const TextStyle(decorationColor: Colors.black, fontSize: 16),
            selectedLabelStyle:
                const TextStyle(decorationColor: Colors.black, fontSize: 16),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => AppCubit())],
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return const Directionality(
                  textDirection: TextDirection.rtl, child: LoginScreen());
            },
          ),
        ));
  }
}
