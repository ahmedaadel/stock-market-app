import 'package:borsetak/Shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../models/stock.dart';

class TawsyatScreen extends StatelessWidget {
  const TawsyatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return StreamBuilder(
        stream:FirebaseFirestore.instance.collection('tawsya').snapshots() ,
      builder: (context, snapshot) {
        return ConditionalBuilder(
          condition: snapshot.connectionState != ConnectionState.waiting,
         fallback: (context) => const Center(child: CircularProgressIndicator()),
         builder: (context) => Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'التوصيات',
                 style: TextStyle( fontSize: getAppSize(context, 25)),
               ),
               SizedBox(
                 height: getAppheight(context, 20),
               ),
               Container(
                 height: getAppheight(context, 40),
                 width: double.infinity,
                 child: TextFormField(
                   textAlignVertical: TextAlignVertical.bottom,
                   decoration: InputDecoration(
                     hintText: "ابحث عن توصيه",
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
               SizedBox(height: getAppheight(context, 30),),
               Expanded(
                 child: ListView.separated(
                     itemBuilder: (context, index) {
                       return newsBuilder2 (Stock(name: snapshot.data!.docs[index]['sahm'],
                           description: snapshot.data!.docs[index]['description']), context);
                     },
                     separatorBuilder: (context,index)=>SizedBox(height: getAppheight(context, 21),),
                     itemCount: snapshot.data!.docs.length ),
               )

             ],
           ),


         )
        );
      },
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
Widget newsBuilder2(Stock stock,context,){
  return   Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12)
    ),
    child: RawMaterialButton(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)
      ),
        onPressed: (){},
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                height: getAppheight(context, 157),
                width: getAPPWidth(context, 335),
                decoration: BoxDecoration(
                image:const DecorationImage(image: AssetImage("assets/images/holding phone.png"),fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(12),
              ),),
              SizedBox(height: getAppheight(context, 6),),
              Text(stock.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1,
                  letterSpacing: 1,
                  fontSize: getAppSize(context, 18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
             // SizedBox(height:getAppheight(context, 10),),
              Text(stock.description,
                style: TextStyle(
                  height: 1.2,
                  fontSize: getAppSize(context, 16),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],

                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ]
        ),
      ),
  );
}