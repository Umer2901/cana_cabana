import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/core/controllers/payment_method_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/screens/delivery_info.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});
  final PaymentMethodController controller =
      Get.find<PaymentMethodController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Payment Method"),
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
                            child: CircleWithIcon(),
                          ),
                        ),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
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
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Moneris",
                  image: AppImages.moneris,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Visa",
                  image: AppImages.visa,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Mastercard",
                  image: AppImages.mastercard,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Amex",
                  image: AppImages.amex,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Apple Pay",
                  image: AppImages.applePay,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => PaymentMethodCard(
                  groupValue: controller.choosenOption.value,
                  value: "Google Pay",
                  image: AppImages.googlePay,
                  onChanged: (value) {
                    if (value != null) {
                      controller.choosenOption.value = value;
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomButton(
                text: "Next",
                onTap: () {
                  Get.toNamed(AppRoute.addNewCard);
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

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({
    required this.groupValue,
    required this.value,
    required this.image,
    this.onChanged,
    super.key,
  });
  final String groupValue;
  final String value;
  final void Function(String?)? onChanged;
  final String image;
  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  @override
  Widget build(BuildContext context) {
    final PaymentMethodController controller =
        Get.find<PaymentMethodController>();
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      onTap: () {
        controller.choosenOption.value = widget.value;
      },
      child: SizedBox(
        height: Get.height * 0.07,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  Image.asset(widget.image),
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  Text(
                    widget.value,
                    style: const TextStyle(
                      fontFamily: AppFont.montserratBold,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              Radio(
                  activeColor: AppColors.primaryColor,
                  // fillColor: AppColors.primaryColor,
                  value: widget.value,
                  groupValue: widget.groupValue,
                  onChanged: widget.onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
