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

class MyContainer extends StatefulWidget {
  final String text;

  const MyContainer({super.key, required this.text});

  @override
  MyContainerState createState() => MyContainerState();
}

class MyContainerState extends State<MyContainer> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
          color: isClicked ? Colors.black : Colors.white,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: isClicked ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  child: Image.asset("assets/images/unbeatablelogo.png"),
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
                height:
                    20, // Added spacing between the toggle button and MyContainer
              ),
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower')
                ],
              )),
              const SizedBox(
                height:
                    10, // Added spacing between the toggle button and MyContainer
              ),
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower')
                ],
              )),
              const SizedBox(
                height:
                    10, // Added spacing between the toggle button and MyContainer
              ),
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower')
                ],
              )),
              const SizedBox(
                height:
                    10, // Added spacing between the toggle button and MyContainer
              ),
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower')
                ],
              )),
              const SizedBox(
                height:
                    10, // Added spacing between the toggle button and MyContainer
              ),
              const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower'),
                  MyContainer(text: 'Dried Flower')
                ],
              )),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF124069),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Update to Elite',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "By using this application, you are agreeing to our terms & conditions and privacy policy",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
