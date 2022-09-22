import 'package:borsetak/modules/Login.dart';
import 'package:borsetak/modules/segel_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<FirebaseApp> initFirebase()
  async{
    FirebaseApp firebaseApp= await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext contex) {
    return  MaterialApp (

      theme: ThemeData(
 scaffoldBackgroundColor: Colors.white,
        appBarTheme:const AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.black87),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
          elevation: 0.0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
        )
      ),
      debugShowCheckedModeBanner: false,
      home:  SegelScreen(),
    );
  }
}


