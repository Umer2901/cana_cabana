import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/core/controllers/home_wrapper_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/cart/cart.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/home/home.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/profile/profile.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  HomeWrapper({super.key});
  final HomeWrapperController controller = Get.find<HomeWrapperController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.bottomBarIndex.value = index;
        },
        children: [
          Home(),
          SearchScreen(),
          CartScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: AppColors.grey,
          currentIndex: controller.bottomBarIndex.value,
          onTap: (value) {
            controller.pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          selectedItemColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                Icons.search_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
