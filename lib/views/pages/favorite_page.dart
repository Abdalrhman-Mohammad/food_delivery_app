import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/views/pages/details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Product> shownfavoriteItems = favoriteProducts;
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Categories:",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: selectedCategory == dummyCategories[index].id
                          ? AppColors.primary
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedCategory != dummyCategories[index].id) {
                              selectedCategory = dummyCategories[index].id;
                              shownfavoriteItems = favoriteProducts
                                  .where((element) =>
                                      element.category.id ==
                                      dummyCategories[index].id)
                                  .toList();
                            } else {
                              selectedCategory = null;
                              shownfavoriteItems = favoriteProducts;
                            }
                          });
                        },
                        child: Text(
                          dummyCategories[index].name,
                          style: TextStyle(
                            color: selectedCategory == dummyCategories[index].id
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(selectedCategory == null
                  ? "All"
                  : dummyCategories
                      .where((element) => element.id == selectedCategory)
                      .toList()[0]
                      .name),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("${shownfavoriteItems.length} recipes"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shownfavoriteItems.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        // horizontal: 30,
                        vertical: 20,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  product: shownfavoriteItems[index]),
                            ),
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.grey.withOpacity(0.5),
                            ),
                          ),
                          child: SizedBox(
                            height: 110,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 120,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                            child: VerticalDivider(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            shownfavoriteItems[index]
                                                .category
                                                .name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.share,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                favoriteProducts.remove(
                                                    shownfavoriteItems[index]);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.favorite,
                                              color: AppColors.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          shownfavoriteItems[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.outdoor_grill),
                                          Text(
                                              "${shownfavoriteItems[index].cokkingTime} min"),
                                          Spacer(),
                                          const Icon(Icons.fireplace),
                                          Text(
                                              "${shownfavoriteItems[index].cokkingTime} min"),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey,
                              blurRadius: 60,
                              spreadRadius: -5,
                              offset: Offset(20, 40),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 115,
                          height: 105,
                          child: Image.network(
                            shownfavoriteItems[index].imgUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
