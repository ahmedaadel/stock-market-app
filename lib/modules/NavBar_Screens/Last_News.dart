import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LastNewsScreen extends StatelessWidget {
  const LastNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return  Padding(
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
            )
          ],
        ),
      );

  }
}

Widget newsBuilder() => Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(''), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
