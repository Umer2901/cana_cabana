import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  CustomToggleSwitchState createState() => CustomToggleSwitchState();
}

class CustomToggleSwitchState extends State<CustomToggleSwitch> {
  int selectedIndex = 2;

  List<String> labels = [
    'My Favorite',
    'Account Detail',
    'Membership card',
  ];
  List<Color> backgroundColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color:
                  index == selectedIndex ? Colors.red : backgroundColors[index],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              labels[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      })
          .map((widget) => Row(
                children: [
                  widget,
                  const SizedBox(width: 16), // Adjust the width as needed
                ],
              ))
          .toList(),
    );
  }
}

class MembershipElite extends StatelessWidget {
  const MembershipElite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF124069),
      appBar: AppBar(
        backgroundColor: const Color(0xFF124069),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 208,
                  child: Image.asset("assets/images/elitelogo.png"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEEEF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomToggleSwitch(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset("assets/images/whitebarcode.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
