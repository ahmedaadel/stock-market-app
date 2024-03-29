import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_Cubit.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTawsyaScreen extends StatefulWidget {
  const AddTawsyaScreen({super.key});

  @override
  State<AddTawsyaScreen> createState() => _AddTawsyaScreenState();
}

class _AddTawsyaScreenState extends State<AddTawsyaScreen> {
  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();
    var beforeController = TextEditingController();
    var afterController = TextEditingController();
    var sahmController = TextEditingController();

    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);

        return ConditionalBuilder(condition: state is !AdminaddTawsyaLoadingState, builder:(context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
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
                body: Center(
                  child: Column(
                    children: [
                      DefaultText(
                        text: "اضافة توصية",
                        font: "",
                        font_size: getAppSize(context, 23.75),
                      ),
                      SizedBox(
                        height: getAppheight(context, 8),
                      ),
                      Expanded(
                        child: Container(
                          width: getAPPWidth(context, 360),
                          decoration: const BoxDecoration(
                              color: Color(0xff353535),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: getAppheight(context, 35),
                                right: 15.5,
                                left: 15.5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                        text: "اسم السهم",
                                        font: "Cairo",
                                        font_size: 20,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/stock.svg",
                                      height: getAppSize(context, 41),
                                      width: getAppSize(context, 41),
                                    ),
                                    const Expanded(child: SizedBox(width: 0)),
                                    MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          descriptionController.text = '';
                                          afterController.text = '';
                                          beforeController.text = '';
                                          sahmController.text = '';
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(14)),
                                      color: Color(0xff1282A2),
                                      child: SvgPicture.asset(
                                        "assets/icons/trashh.svg",
                                        width: 50,
                                        height: 23,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 171,
                                      height: 35,
                                      child: TextFormField(
                                        controller: sahmController,
                                        textAlignVertical:
                                        TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                            hintText: "مثلا: سهم الرياض",
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
                                        text: "الوصف",
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
                                    controller: descriptionController,
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
                                  height: getAppheight(context, 51),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            DefaultText(
                                              text: "سعر الشراء",
                                              color: Colors.white,
                                              font: "Cairo",
                                              font_size: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/buy.svg",
                                                height: getAppSize(context, 30),
                                                width: getAppSize(context, 30)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: getAppheight(context, 18),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            width: 82,
                                            height: 32,
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              controller: beforeController,
                                              textAlignVertical:
                                              TextAlignVertical.bottom,
                                              textAlign: TextAlign.end,
                                              decoration: InputDecoration(
                                                  hintText: "\$",
                                                  hintStyle: const TextStyle(
                                                      color: Color(0x66000000)),
                                                  filled: true,
                                                  fillColor:
                                                  const Color(0xfff1f2f2),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Expanded(
                                        child: SizedBox(
                                          width: 0,
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            DefaultText(
                                                text: "سعر البيع",
                                                color: Colors.white,
                                                font: "Cairo",
                                                font_size: 20),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            SvgPicture.asset(
                                                "assets/icons/sell.svg",
                                                height: getAppSize(context, 30),
                                                width: getAppSize(context, 30)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: getAppheight(context, 18),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            width: 82,
                                            height: 32,
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              controller: afterController,
                                              textAlignVertical:
                                              TextAlignVertical.bottom,
                                              textAlign: TextAlign.end,
                                              decoration: InputDecoration(
                                                  hintText: "\$",
                                                  hintStyle: const TextStyle(
                                                      color: Color(0x66000000)),
                                                  filled: true,
                                                  fillColor: const Color(0xfff1f2f2),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5))),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(height: getAppheight(context, 50),),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: getAPPWidth(context, 254),
                                        height: getAppheight(context, 53),
                                        child: MaterialButton(
                                          //database insert add tawsya logic
                                            onPressed: () {
                                              cubit.addTawsya(
                                                  sahm: sahmController.text,
                                                  description:
                                                  descriptionController.text,
                                                  priceBefore:
                                                  beforeController.text,
                                                  priceAfter:
                                                  afterController.text);

                                              setState(() {
                                                descriptionController.text = '';
                                                afterController.text = '';
                                                beforeController.text = '';
                                                sahmController.text = '';
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
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
            fallback:(context) => const Center(child: CupertinoActivityIndicator(),));      },
    );
  }
}
