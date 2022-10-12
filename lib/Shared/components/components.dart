import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget textForm({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  required String labelText,
  Function? onChange,
  IconButton? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
    TextFormField(
      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );

Widget searchForm({
  required TextEditingController controller,
  required String labelText,
  Function? onChange,
  IconButton? suffixIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: (value) => onChange,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: labelText,
          suffixIcon: suffixIcon),
    );

void showToast({required String text, required ToastState state}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { success, error, warning }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case (ToastState.success):
      color = Colors.green;
      break;
    case (ToastState.error):
      color = Colors.red;
      break;
    case (ToastState.warning):
      color = Colors.amber;
      break;
  }
  return color;
}

Text DefaultText({
  String text="",
  Color color=Colors.black,
  String  font="ReemKufi",
  double ? font_size 


}){

  return Text(
    text,
    style:TextStyle(
    color: color,
    fontFamily: font,
    fontSize: font_size,


  ));
}