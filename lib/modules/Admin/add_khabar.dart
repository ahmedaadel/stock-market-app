import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_Cubit.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AddNewsScreen extends StatefulWidget {
  const AddNewsScreen({Key? key}) : super(key: key);

  @override
  State<AddNewsScreen> createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  @override
  Widget build(BuildContext context) {
    var newsController = TextEditingController();
    var timeController = TextEditingController();
    var scaffoldKey=GlobalKey<ScaffoldState>();
    return BlocConsumer<AdminCubit,AdminStates>(
        listener: (context, state) {

        },
    builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key:scaffoldKey ,
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: getAPPWidth(context, 50)),
              child: Center(
                child: DefaultText(
                  text: "AlliaNz",
                  font_size: getAppSize(context, 22),
                ),
              ),
            ),
          ),
          body: Column(children:
          [
            DefaultText(
              text: "اضافة خبر",
              font: "",
              font_size: getAppSize(context, 23.75),
            ),
            SizedBox(
              height: getAppheight(context, 8),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: getAPPWidth(context, 360),
                    decoration: const BoxDecoration(
                        color: Color(0xff353535),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DefaultText(
                                text: "التوقيت",
                                font: "Cairo",
                                font_size: 20,
                                color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(IconlyBroken.timeSquare,color: Colors.white,),
                            const Expanded(child: SizedBox(width: 0)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 171,
                              height: 35,
                              child: TextFormField(
                                controller: timeController,
                                onTap: (){
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse(
                                          '2023-08-22'))
                                      .then((value) {
                                    timeController.text = formatDate(value!, [yyyy,'-',m,'-',d]);
                                  });
                                },
                                textAlignVertical:
                                TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                    hintText: "التوقيت",
                                    hintStyle: const TextStyle(
                                        color:  Color(0x66000000)),
                                    filled: true,
                                    fillColor: const Color(0xfff1f2f2),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getAppheight(context, 36),
                        ),
                        Row(
                          children: [
                            DefaultText(
                                text: "الخبر",
                                font: "Cairo",
                                font_size: 22,
                                color: Colors.white),
                            SvgPicture.asset(
                              "assets/icons/description.svg",
                              height: getAppSize(context, 41),
                              width: getAppSize(context, 41),
                            ),
                          ],
                        ),
                        Container(
                          width: 320,
                          height: getAppheight(context, 128),
                          child: TextFormField(
                            controller: newsController,
                            maxLines: 6,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              // hintText: "مثلا:  ارتفع سهم الرياض وسوف تكون فرصة جيدة للشراء",
                                hintStyle: const TextStyle(
                                    color: Color(0x66000000)),
                                filled: true,
                                fillColor: const Color(0xfff1f2f2),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(12))),
                          ),
                        ),
                        SizedBox(
                          height: getAppheight(context, 36),
                        ),

                        Container(
                          width: getAPPWidth(context, 254),
                          height: getAppheight(context, 53),
                          child: MaterialButton(
                            //database insert add tawsya logic
                              onPressed: () {
                                AdminCubit.get(context).addNewsToDataBase(dateTime: timeController.text,news: newsController.text).
                                then((value){
                                  setState(() {
                                    timeController.text='';
                                    newsController.text='' ;
                                  });
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(12)),
                              color: const Color(0xff8cd351),
                              child: Center(
                                child: DefaultText(
                                    text: "ارسال",
                                    color: Colors.white,
                                    font: "Cairo",
                                    font_size: 25),
                              )),
                        ),
                      ],
                    )
                ))
          ]),
        ),
      );
    },);
  }
}
