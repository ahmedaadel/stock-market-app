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
          'Hello Sir',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.snapchat, size: 35))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          textBaseline:TextBaseline.alphabetic ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Through recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: screenHeight / 5,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.black54,
                child: Row(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.lightGreen,
                        child: Text('SAR',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        textBaseline:TextBaseline.alphabetic ,

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("\$ 2000.0",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),

                          SizedBox(height: 10,),
                          Text("ريال سعودي ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(
                      child: Text('+18 %',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Image.asset('assets/images/market.png',))
          ],
        ),
      ),
    );
  }
}
