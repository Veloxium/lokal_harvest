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

  final List<Map<String, String>> itemsCategory = [
    {"text": "Sayuran", "link": "assets/iconcategory/sayuran.png"},
    {"text": "Daging", "link": "assets/iconcategory/daging.png"},
    {"text": "Buah", "link": "assets/iconcategory/buahbuahan.png"},
    {"text": "Seafood", "link": "assets/iconcategory/seafood.png"},
    {"text": "Biji-Bijian", "link": "assets/iconcategory/bijibijian.png"},
    {"text": "Bumbu", "link": "assets/iconcategory/bumbu.png"},
    {"text": "Umbi-Umbian", "link": "assets/iconcategory/ubiumbi.png"},
    {"text": "Makanan Sehat", "link": "assets/iconcategory/makanan.png"},
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
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                  color: const Color(0xffeaeaea),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 3))
                  ]),
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.7,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (var item in itemsCategory)
                      Column(
                        children: [
                          Container(
                            height: 40,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item["link"]!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item["text"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ]),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Berita Terbaru",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Lihat Semua",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Colors.grey[500],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
