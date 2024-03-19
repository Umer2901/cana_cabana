import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Delivery Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Stack(
                      children: [
                        SizedBox(
                            height: Get.height * 0.06,
                            child: const Center(child: DottedLine())),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CircleWithDot(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Info",
                        style: TextStyle(fontFamily: AppFont.montserratBold),
                      ),
                      Text(
                        "Payment Method",
                        style: TextStyle(fontFamily: AppFont.montserratBold),
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(fontFamily: AppFont.montserratBold),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const TextFieldWithHeading(
                heading: "Full Name",
                hintText: "John Doe",
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const TextFieldWithHeading(
                heading: "Email",
                hintText: "abc@gmail.com",
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const TextFieldWithHeading(
                heading: "Phone Number",
                hintText: "+ 1 819 555 5555",
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const TextFieldWithHeading(
                heading: "Address",
                hintText: "",
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    child: TextFieldWithHeading(
                      heading: "Postal Code",
                      hintText: "",
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.2,
                  ),
                  const Expanded(
                    child: TextFieldWithHeading(
                      heading: "City",
                      hintText: "",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const MultiLineTextfield(
                heading: "Delivery Instructions",
                hintText: "Max 150 characters",
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomButton(
                text: "Next",
                onTap: () {
                  Get.toNamed(AppRoute.paymentMethod);
                },
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(),
      child: const SizedBox(
        width: double.infinity,
        height: 1.0, // Adjust the height of the line as needed
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    double dashWidth = 5.0;
    double dashSpace = 5.0;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleWithIcon extends StatelessWidget {
  const CircleWithIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.1,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor, // Change the color as needed
      ),
      child: const Center(
        child: Icon(
          Icons.done_rounded, // Change the icon as needed
          color: Colors.white, // Change the icon color as needed
        ),
      ),
    );
  }
}

class CircleWithDot extends StatelessWidget {
  const CircleWithDot({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.1,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 4,
        ),
        shape: BoxShape.circle,
        color: AppColors.white, // Change the color as needed
      ),
      child: Center(
          child: Container(
        height: Get.height * 0.02,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor, // Change the color as needed
        ),
      )),
    );
  }
}

class TextFieldWithHeading extends StatelessWidget {
  const TextFieldWithHeading({
    required this.heading,
    required this.hintText,
    super.key,
  });
  final String heading;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            heading,
            style: const TextStyle(
              fontFamily: AppFont.montserrat,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        CustomTextField(
          hintText: hintText,
          elevation: 1,
          color: AppColors.white,
        )
      ],
    );
  }
}

class MultiLineTextfield extends StatelessWidget {
  const MultiLineTextfield({
    required this.heading,
    required this.hintText,
    super.key,
  });
  final String heading;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            heading,
            style: const TextStyle(
              fontFamily: AppFont.montserrat,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        CustomTextField(
          hintText: hintText,
          elevation: 1,
          maxLines: 5,
          color: AppColors.white,
        )
      ],
    );
  }
}
