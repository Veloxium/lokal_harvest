import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_uas/components/carousel/ccarousel.dart';
import 'package:project_uas/features/home/controller/home_controller.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController());

  final List<String> itemsImages = [
    "https://cdnb.artstation.com/p/assets/images/images/073/385/693/large/michal-kalisz-wpn-dlc-chainsword-side01.jpg?1709553789",
    "https://cdna.artstation.com/p/assets/images/images/073/743/622/large/michal-kalisz-wpn-dlc-chainsword-top1.jpg?1710363661",
    "https://cdna.artstation.com/p/assets/images/images/073/379/486/large/michal-kalisz-wpn-dlc-chainsword-clayrender-01.jpg?1709541992",
    "https://cdna.artstation.com/p/assets/images/images/073/388/932/large/michal-kalisz-wpn-dlc-chainsword-closeup-03.jpg?1709558894",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              height: 60,
              color: CColors.primary,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                controller.changeOnTap(true);
                              },
                              onFieldSubmitted: (value) {
                                controller.changeOnTap(false);
                              },
                              onTapOutside: (event) {
                                controller.changeOnTap(false);
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText:
                                    "Cari makanan, sayuran, & buah-buahan",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedContainer(
                      alignment: Alignment.centerRight,
                      duration: const Duration(
                          milliseconds: 200), // Adjust duration as needed
                      width: controller.onTap.value ? 0 : 140,
                      child: controller.onTap.value
                          ? const SizedBox()
                          : FutureBuilder<bool>(
                              future: Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => true),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SizedBox();
                                } else {
                                  return IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.cart,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  );
                                }
                              }),
                    ),
                  ),
                ],
              ),
            ),
            CCarousel(
              itemsImages: itemsImages,
            )
          ],
        ));
  }
}
