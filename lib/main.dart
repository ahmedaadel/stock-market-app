import 'package:borsetak/modules/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return const MaterialApp (
      debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
    );
  }
}


