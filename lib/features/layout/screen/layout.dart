import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/auth/screen/login.dart';
import 'package:project_uas/features/auth/screen/register.dart';
import 'package:project_uas/features/home/screen/home.dart';
import 'package:project_uas/features/layout/controller/layout_controller.dart';
import 'package:project_uas/features/products/screen/product.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final LayoutController controller = Get.put(LayoutController());
  final PageController _pageController = PageController();
  final List<Widget> _children = [
    HomeScreen(),
    ProductScreen(),
    RegisterScreen(),
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CColors.primary,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            controller.changeIndex(index.obs);
          },
          children: _children,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: BottomAppBar(
          height: 76,
          notchMargin: 10.0,
          shape: const CircularNotchedRectangle(),
          color: CColors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < 4; i++)
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  },
                  icon: Obx(
                    () => Icon(
                      i == 0
                          ? Icons.home
                          : i == 1
                              ? Icons.store_mall_directory
                              : i == 2
                                  ? CupertinoIcons.chat_bubble_2_fill
                                  : CupertinoIcons.person_crop_circle_fill,
                      size: 34,
                      color: controller.selectedIndex.value == i
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
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
