import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/dialogs/order_completion_dilog.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale,
      appBar: AppBar(
        backgroundColor: AppColors.greyScale,
        title: const Text("E-Receipt"),
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
              Image.asset(AppImages.receipt),
              SizedBox(
                height: Get.height * 0.001,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              const ItemCard(),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const AmountCard(),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const OrderInfo(),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomButton(
                text: "Done",
                onTap: () {
                  showOrderCompletionDialog();
                },
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C04060F),
            blurRadius: 60,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFF8F8F8),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.productImage),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Spinach Wedding Cake',
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Qty = 1',
                                    style: TextStyle(
                                      color: Color(0xFF606060),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AmountCard extends StatelessWidget {
  const AmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: const ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Amount",
                style: TextStyle(
                  fontFamily: AppFont.montserrat,
                  fontSize: 15,
                ),
              ),
              Text(
                "\$29",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Promo",
                style: TextStyle(
                  fontFamily: AppFont.montserrat,
                  color: AppColors.primaryColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "-\$9",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Divider(),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontFamily: AppFont.montserrat,
                  fontSize: 15,
                ),
              ),
              Text(
                "\$20",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: const ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Methods",
                style: TextStyle(
                    fontFamily: AppFont.montserratBold,
                    fontSize: 15,
                    color: AppColors.grey),
              ),
              Text(
                "Amex",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              Text(
                "Dec 15, 2023 | 10:00:27 AM",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction ID",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              Text(
                "SK7263727399",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              Text(
                "Paid",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order type",
                style: TextStyle(
                  fontFamily: AppFont.montserratBold,
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              RadioButtonRow(),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
        ],
      ),
    );
  }
}

class RadioButtonRow extends StatefulWidget {
  const RadioButtonRow({super.key});

  @override
  RadioButtonRowState createState() => RadioButtonRowState();
}

class RadioButtonRowState extends State<RadioButtonRow> {
  String selectedValue = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          activeColor: AppColors.primaryColor,
          value: selectedValue,
          groupValue: selectedValue,
          onChanged: (value) {},
        ),
        const Text(
          'Delivery',
          style: TextStyle(fontFamily: AppFont.montserratBold),
        ),
      ],
    );
  }
}
