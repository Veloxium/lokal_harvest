import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/home/controller/home_controller.dart';
import 'package:project_uas/features/products/controller/product_controller.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<String> category = [
    "Semua",
    "Sayuran",
    "Daging",
    "Buah",
    "Seafood",
    "Biji-Bijian",
    "Bumbu",
    "Umbian",
    "Makanan",
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    final controllerProduct = Get.put(ProductController());
    return Scaffold(
      backgroundColor: CColors.background,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            height: 60,
            color: CColors.primary,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
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
                              hintText: "Cari makanan, sayuran, & buah-buahan",
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
                                const Duration(milliseconds: 200), () => true),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in category)
                  InkWell(
                    onTap: () => controllerProduct.changeCategory(item),
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  controllerProduct.selectCategory.value == item
                                      ? CColors.primary
                                      : Colors.grey,
                              width:
                                  controllerProduct.selectCategory.value == item
                                      ? 4
                                      : 3,
                            ),
                          ),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: CColors.primary,
                            fontSize: 15,
                            fontWeight:
                                controllerProduct.selectCategory.value == item
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                
                child: Row(
                  children: [
                    const SizedBox(
                    width: 10.0,
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/category/sayuran/images/bayam.png",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Bayam Orang",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "/kg",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Rp. 100.000",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Terjual : 200",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Stock : 28",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: CColors.tag,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  const Text(
                                    "Sayuran",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: CColors.primary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 12),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.plus, color: Colors.white, size: 26,),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
