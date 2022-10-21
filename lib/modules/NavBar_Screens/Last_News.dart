import 'package:borsetak/Shared/components/constants.dart';
import 'package:borsetak/models/News_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LastNewsScreen extends StatelessWidget {
  const LastNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('news').orderBy('dateTime').snapshots(),
      builder: (context, snapshot) {
        return ConditionalBuilder(
            condition: snapshot.connectionState != ConnectionState.waiting,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) =>  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اخر الاخبار',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: getAppSize(context, 25)),
                  ),
                  SizedBox(
                    height: getAppheight(context, 16),
                  ),
                  Container(
                    height: getAppheight(context, 40),
                    width: double.infinity,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: "ابحث عن خبر",
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(fontWeight: FontWeight.bold,color:const Color(0x66000000),fontSize: getAppSize(context, 15)),
                        filled: true,
                        suffixIcon: IconButton(onPressed:(){} ,icon: Icon(IconlyBroken.search,size: getAppSize(context, 23),),color: defaultColor,),
                        fillColor: const Color(0x80F0F0F0),
                        border:OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: ListView.separated(itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Colors.black26,width: double.infinity,height: 1),
                    ),
                    itemBuilder:(context, index) => newsBuilder(NewsModel(news: snapshot.data!.docs[index]['news'],
                        dateTime:snapshot.data!.docs[index]['dateTime'] )) ,))
                ],
              ),
            )
        );
      },
    );

  }
}

Widget newsBuilder(NewsModel newsModel) => Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              newsModel.news!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 7,),
            Text(
              newsModel.dateTime!,

              style: const TextStyle(color: Colors.grey),

            ),

          ],
        )
      ),
    );

