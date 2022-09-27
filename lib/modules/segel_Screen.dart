import 'package:borsetak/Shared/components/constants.dart';
import 'package:flutter/material.dart';

class SegelScreen extends StatefulWidget {
  const SegelScreen({Key? key}) : super(key: key);

  @override
  State<SegelScreen> createState() => _SegelScreenState();
}

class _SegelScreenState extends State<SegelScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          ' Ali أهلا ',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.snapchat, size: 35))
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
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('سجل الارباح ',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('من خلال التوصيات',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              width: double.infinity,
              height: screenHeight / 5,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.black54,
                child: Row(
                  children: [

                    const SizedBox(
                      width: 10,
                    ),

                    const Expanded(
                      flex:1,
                      child: Text('+18 %',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.w600)),
                    ),

                    Expanded(
                      flex: 2,
                      child: Column(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("\$ 2000.0",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("ريال سعودي ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: defaultColor,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),

                    const Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: defaultColor,
                        child: Text('SAR',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                  child: Image.asset(
                'assets/images/segel.png',
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth / 5,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'AlliaNz',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
