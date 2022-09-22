// ignore_for_file: prefer_const_constructors
import 'package:borsetak/Layout/Home_Layout.dart';
import 'package:borsetak/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyAppState();
}

class _MyAppState extends State<LoginScreen> {
  var username = TextEditingController();
  var emailCtr = TextEditingController();
  var passCtr = TextEditingController();
  var signEmailCtr = TextEditingController();
  var signPassCtr = TextEditingController();
  var signPassCtr2 = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSecure = true;

  static Future<User?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential usr = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = usr.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('User Not Found ');
      }
    }

    return user;
  }

  String? validationFun(value, String msg) {
    if (value!.isEmpty) {
      return msg;
    }
    return null;
  }

  void signUp({
    required String email,
    required String password,
  }) async {
    try {
      var newAcc = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (newAcc.user != null) print('Success');
    } catch (error) {
      print(error.toString());
    }
  }

  Widget signSheet(context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 6, right: 10, top: 19),
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: formKey2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: textForm(
                          validationFun: (value) =>
                              validationFun(value, 'Ur name can not be empty'),
                          controller: username,
                          labelText: 'User name')),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: textForm(
                          validationFun: (value) => validationFun(
                              value, 'Email address can not be empty'),
                          controller: signEmailCtr,
                          labelText: 'Email')),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: textForm(
                          validationFun: (value) =>
                              validationFun(value, 'password can not be empty'),
                          controller: signPassCtr,
                          labelText: 'Password',
                          secure: true)),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: textForm(
                          validationFun: (value) {
                            if (value!.isEmpty) {
                              return 'password can not be empty';
                            }
                            if (signPassCtr.text != signPassCtr2.text) {
                              return 'You must write the same password twice';
                            }
                            if (signPassCtr.text == signPassCtr2.text) {
                              return null;
                            }
                          },
                          controller: signPassCtr2,
                          labelText: 'Confirm  Password',
                          secure: true)),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey2.currentState!.validate()) {
                          signUp(
                              email: signEmailCtr.text,
                              password: signPassCtr.text);
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          primary: Colors.teal[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Text('sign up', style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.lightGreen,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(21),
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        textForm(
                            validationFun: (value) => validationFun(
                                value, 'Email address can not be empty '),
                            controller: emailCtr,
                            labelText: 'Email',
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon:
                                    Icon(Icons.email, color: Colors.black87))),
                        SizedBox(
                          height: 15,
                        ),
                        textForm(
                          secure: isSecure,
                          validationFun: (value) =>
                              validationFun(value, 'password can not be empty'),
                          controller: passCtr,
                          labelText: 'Password',
                          prefixIcon: IconButton(
                            icon: Icon(Icons.lock, color: Colors.black87),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                });
                              },
                              icon: isSecure
                                  ? Icon(
                                      Icons.visibility_sharp,
                                      color: Colors.black87,
                                    )
                                  : Icon(Icons.visibility_off,
                                      color: Colors.black87)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              User? user = await signIn(
                                  email: emailCtr.text,
                                  password: passCtr.text,
                                  context: context).then((value) {
                                if (value != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomeLayout()));
                                }
                                else {
                                  showToast(text: 'Email address or password is wrong', state: ToastState.error);
                                }
                              });

                            }
                          },
                          style: ElevatedButton.styleFrom(

                              padding: EdgeInsets.symmetric(horizontal: 40),
                              backgroundColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child:
                              Text('sign in', style: TextStyle(fontSize: 17)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextDivider.horizontal(
                            text: Text('or'),
                            color: Colors.black,
                            size: 50,
                            thickness: .7),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New account ?',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            TextButton(
                                onPressed: () {
                                  scaffoldKey.currentState!.showBottomSheet(
                                      (context) => signSheet(context));
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.vertical(
// top: Radius.circular(10))));
