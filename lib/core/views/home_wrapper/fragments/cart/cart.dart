import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/product_card.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/cart_controller.dart';
import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController controller = Get.find<CartController>();
  final HomeWrapperController wrapperController =
      Get.find<HomeWrapperController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:
              controller.cartItems.isNotEmpty ? const Text("Your cart") : null,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: controller.cartItems.isNotEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: CartItemCard(
                                    showPrice: true,
                                    product: controller.cartItems[index],
                                    onDeleteTapped: () {
                                      controller.cartItems.removeAt(index);
                                      controller.update();
                                    },
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      EliteButton(onTap: () {}),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTextField(
                          color: AppColors.white,
                          elevation: 5,
                          hintText: "Promo Code",
                          prefixIcon: const Icon(
                            Icons.confirmation_number_rounded,
                            size: 28,
                            color: AppColors.primaryColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Container(
                              width: Get.width * 0.2,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.primaryColor),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontFamily: AppFont.montserratBold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      const RadioButtonRow(),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontFamily: AppFont.montserratBold,
                                    fontSize: 25,
                                  ),
                                ),
                                Obx(() => Text(
                                      "\$${controller.totalAmount().value}",
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontFamily: AppFont.montserrat,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.013,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "You save amount (with membership)",
                                  style: TextStyle(
                                    fontFamily: AppFont.montserrat,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Obx(() => Text(
                                      "\$${controller.savings().value}",
                                      style: const TextStyle(
                                          fontFamily: AppFont.montserrat,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17),
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Equivalent Amount",
                                  style: TextStyle(
                                    fontFamily: AppFont.montserrat,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Obx(() => Text(
                                      "${controller.equivalentAmount().value}g",
                                      style: const TextStyle(
                                          fontFamily: AppFont.montserrat,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InkWell(
                        onTap: () async {
                          showLoading();
                       
                          Get.toNamed(AppRoute.moneris);
                        },
                        child: Ink(
                          width: 269,
                          height: 58,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF064A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F01B763),
                                blurRadius: 24,
                                offset: Offset(4, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 22,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Checkout',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          height: 0.09,
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * 0.04),
                        SvgPicture.asset(AppImages.logo),
                        const SizedBox(height: 10),
                        SvgPicture.asset(AppImages.unbeatablePrices),
                        SizedBox(height: Get.height * 0.04),
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primaryColor,
                          size: Get.height * 0.08,
                        ),
                        Text(
                          "Your Cart is Empty",
                          style: TextStyle(
                              fontFamily: AppFont.montserratBold,
                              fontSize: Get.height * 0.027),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                          child: CustomButton(
                            text: "Shop Now",
                            onTap: () {
                              wrapperController.pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
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
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          activeColor: AppColors.primaryColor,
          value: 'Delivery',
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
            });
          },
        ),
        const Text(
          'Delivery',
          style: TextStyle(fontFamily: AppFont.montserratBold),
        ),
        Radio(
          activeColor: AppColors.primaryColor,
          value: 'Pre-paid Pickup',
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
            });
          },
        ),
        const Text(
          'Pre-paid Pickup',
          style: TextStyle(fontFamily: AppFont.montserratBold),
        ),
        Radio(
          activeColor: AppColors.primaryColor,
          value: 'Pay in store',
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
            });
          },
        ),
        const Text(
          'Pay in store',
          style: TextStyle(fontFamily: AppFont.montserratBold),
        ),
      ],
    );
  }
}

class EliteButton extends StatelessWidget {
  const EliteButton({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {},
      child: Ink(
        width: 269,
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: ShapeDecoration(
          color: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F01B763),
              blurRadius: 24,
              offset: Offset(4, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 22,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GradientText(
                      "Upgrade to Elite",
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFFA77214), Color(0xFFE9CC49)],
                      ),
                      style: TextStyle(
                        fontFamily: AppFont.montserratBold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
