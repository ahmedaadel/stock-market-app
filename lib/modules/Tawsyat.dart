import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../models/stock.dart';

class TawsyatScreen extends StatelessWidget {
  const TawsyatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          ' AlliaNz ',
          style: TextStyle(fontSize: getAppSize(context, 22),fontFamily: "ReemKufi",letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon:  Icon(IconlyBroken.notification, size: getAppSize(context, 24)))
        ],
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {}),
      ),
      body: Padding(
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
              width: double.infinity,
              height: getAppheight(context, 39),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getAppSize(context, 14),
                ),
                decoration: InputDecoration(


                  enabledBorder: const UnderlineInputBorder(
                  borderSide:  BorderSide(color: greyColor, width: 1.0),),
                  hintText: "ابحث عن توصية",
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontSize: getAppSize(context, 14),
                  ),
                 
                  suffixIcon:
                   Container(
                    padding:EdgeInsets.only(bottom: 10) ,
                    width: getAPPWidth(context, 32),
                    height: getAppheight(context, 32),
                    decoration: BoxDecoration(
                      
                      borderRadius:BorderRadius.circular(14),
                      color: defaultColor,
                    ),
                    
                    child: IconButton(icon:Icon(IconlyBroken.search,size: getAppSize(context, 20),),
                      onPressed: (){},
                      color: Colors.white,
                      iconSize: getAppSize(context, 16),
                      ),
                  ),
                  border:UnderlineInputBorder(),
                  
                  
                ),
                
              ),
            ),
           SizedBox(height: getAppheight(context, 30),),
            Expanded(
              child: ListView.separated(
              itemBuilder: (context, index) => newsBuilder2(Stock(name: "سهم الرياض",description: "ارتفع سهم الرياض وسوف يكون فرصة جيدة للشراء ف..."), context),
              separatorBuilder: (context,index)=>SizedBox(height: getAppheight(context, 21),),
              itemCount: 4),
            )
            
          ],
        ),
        
        
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

Widget newsBuilder2(Stock stock,context){
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
                image:DecorationImage(image: AssetImage("assets/images/holding phone.png"),fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(12),

              ),
              ),

              SizedBox(height: getAppheight(context, 6),),
              Text("${stock.name}",

                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: getAppSize(context, 16),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  


                ),
              ),
             // SizedBox(height:getAppheight(context, 10),),
              Text("${stock.description}",
                style: TextStyle(
                  fontSize: getAppSize(context, 13),
                  fontWeight: FontWeight.bold,
                  color: greyColor,

                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ]
        ),
      ),
  );
}