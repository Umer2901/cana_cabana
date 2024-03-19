import 'package:flutter/material.dart';

class UpgradeElite extends StatelessWidget {
  const UpgradeElite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/images/cannacabana-logo.png'),
                radius: 20.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'District Store Name',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Hours:10 Am Until 1 Am',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: const Color(0xFFEBEBEB),
            child: IconButton(
              icon: const Icon(Icons.person_2_rounded),
              onPressed: () {
                // Handle icon press
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFF5F5F5),
                          radius: 20.0,
                          child: Image.asset(
                            'assets/images/filter.png',
                            width: 24.0, // Adjust the width as needed
                            height: 24.0, // Adjust the height as needed
                          ),
                        ),
                      ),
                      border: InputBorder.none, // Remove border
                    ),
                  ),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Elite Membership is not available for British Columbia",
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //  height: 170,
                    width: 165,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE9E9E9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: const Color(0xFF124069),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/46.png"),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const Text(
                            "view live Elite savings",
                            style: TextStyle(color: Colors.black),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '60.00',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '/Year',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Annual Membership",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Elite Membership",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting Read More",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(400, 50),
                          ),
                          onPressed: () {},
                          child: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                'Your upgraded ELITE membership is your golden ticket to awesome perks such as:\n\n'
                '• Flash sales**\n'
                '• Exclusive and limited-edition ELITE accessories\n'
                '• A birthday bag on your special day with accessories and goodies!\n'
                '• 50% OFF your delivery fee at delivery-enabled locations',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Image.asset("assets/images/flashsale.png")
            ],
          ),
        ),
      ),
    );
  }
}
