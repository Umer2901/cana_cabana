import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/profile_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/profile/screens/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Center(
          child: GetBuilder<ProfileController>(
            builder: (_) => SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AppImages.eliteLogo),
                  CupertinoNavigationBar(
                    backgroundColor: Colors.transparent,
                    // This Cupertino segmented control has the enum "Sky" as the type.
                    middle: CupertinoSlidingSegmentedControl<Sky>(
                      backgroundColor: AppColors.greyScale,
                      thumbColor: AppColors.primaryColor,
                      // This represents the currently selected segmented control.
                      groupValue: controller.selectedSegment,
                      // Callback that sets the selected segmented control.
                      onValueChanged: (Sky? value) {
                        if (value != null) {
                          setState(() {
                            controller.selectedSegment = value;
                          });
                        }
                      },
                      children: <Sky, Widget>{
                        Sky.accountDetail: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Account Details',
                            style: TextStyle(
                              fontSize: 13,
                              color: controller.selectedSegment ==
                                      Sky.accountDetail
                                  ? AppColors.white
                                  : null,
                            ),
                          ),
                        ),
                        Sky.myOffers: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'My Offers',
                            style: TextStyle(
                              fontSize: 13,
                              color: controller.selectedSegment == Sky.myOffers
                                  ? AppColors.white
                                  : null,
                            ),
                          ),
                        ),
                        Sky.favorites: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Favorites',
                            style: TextStyle(
                              fontSize: 15,
                              color: controller.selectedSegment == Sky.favorites
                                  ? AppColors.white
                                  : AppColors.darkDotColor,
                            ),
                          ),
                        ),
                        Sky.membershipCard: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Membership Card',
                            style: TextStyle(
                              color: controller.selectedSegment ==
                                      Sky.membershipCard
                                  ? AppColors.white
                                  : AppColors.darkDotColor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                  controller.selectedSegment == Sky.accountDetail
                      ? const AccountDetails()
                      : controller.selectedSegment == Sky.myOffers
                          ? const MyOffers()
                          : controller.selectedSegment == Sky.favorites
                              ? const Favorites()
                              : const MembershipCard()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWithHeading extends StatelessWidget {
  const TextFieldWithHeading({
    required this.heading,
    required this.hintText,
    this.textColor = AppColors.white,
    this.controller,
    this.onChanged,
    super.key,
  });
  final String heading;
  final String hintText;
  final Color textColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
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
            style: TextStyle(
              color: textColor,
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
          controller: controller,
          onChanged: onChanged,
        )
      ],
    );
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          TextFieldWithHeading(
            heading: "First Name",
            hintText: "John",
            controller: controller.firstNameController,
            onChanged: (value) {},
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          TextFieldWithHeading(
            heading: "Last Name",
            hintText: "Doe",
            controller: controller.lastNameController,
          ),
          TextFieldWithHeading(
            heading: "Email",
            hintText: "abc@gmail.com",
            controller: controller.emailController,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          TextFieldWithHeading(
            heading: "Phone Number",
            hintText: "+ 1 432 675 324",
            controller: controller.phoneNumberController,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: CustomButton(
              text: "Update",
              borderRadius: BorderRadius.all(Radius.circular(60)),
              onTap: () {
                controller.onUpdatePressed();
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: const CustomButton(
              elevation: 10,
              text: "Manage Elite",
              color: AppColors.blue,
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ChatScreen());
            },
            child: const Text(
              "Need help, Chat with Us or call 1-800-LOVE 420",
              style: TextStyle(
                color: AppColors.white,
                fontFamily: AppFont.montserratBold,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
        ],
      ),
    );
  }
}

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(
            () => Wrap(
              children: List.generate(
                controller.categories.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: Get.height * 0.02),
                    child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        onTap: () {
                          controller.categories[index].isSelected =
                              !controller.categories[index].isSelected;
                          setState(() {});
                        },
                        child: StrainTile(
                          title: controller.categories[index].title,
                          isSelected: controller.categories[index].isSelected,
                        )),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: const CustomButton(
              text: "Update",
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Container(
            width: 144,
            height: 43,
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 10),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 23,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.eliteText),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.3,
          ),
        ],
      ),
    );
  }
}

class StrainTile extends StatelessWidget {
  const StrainTile({this.isSelected = false, required this.title, super.key});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.3,
      child: Ink(
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.blue,
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                fontFamily: AppFont.montserratBold,
                fontSize: 10,
                color: AppColors.white),
          )),
        ),
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
      child: SizedBox(
        height: Get.height * 0.7,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  color: AppColors.white,
                )),
                Image.asset(AppImages.receipt),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyOffers extends StatelessWidget {
  const MyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
    );
  }
}
