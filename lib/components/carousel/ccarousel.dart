import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/components/carousel/ccarousel_controller.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class CCarousel extends StatelessWidget {
  const CCarousel({
    super.key,
    required this.itemsImages,
  });

  final List<String> itemsImages;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CCarouselController());
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.updateCurrentIndex(index),
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                for (int i = 0; i < itemsImages.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      itemsImages[i],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < itemsImages.length; i++)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == i
                            ? CColors.primary
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 20,
                      height: 6,
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
