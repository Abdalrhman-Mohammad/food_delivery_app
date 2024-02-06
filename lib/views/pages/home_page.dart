import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/views/weidgets/item_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? SelectedCategoryItem;
  List<Product> shownHomePageProducts = dummyProducts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-poster-design-template-471879a9187123f71eefd3c08edd0000_screen.jpg"),
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Find your food...  ",
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 80,
                    child: Card(
                      elevation: 0,
                      color: AppColors.white,
                      child: InkWell(
                        onTap: () {
                          setState(
                            () {
                              if (SelectedCategoryItem ==
                                  dummyCategories[index].id) {
                                SelectedCategoryItem = null;
                                shownHomePageProducts = dummyProducts;
                              } else {
                                SelectedCategoryItem =
                                    dummyCategories[index].id;
                                shownHomePageProducts = dummyProducts
                                    .where((element) =>
                                        element.category.id ==
                                        SelectedCategoryItem)
                                    .toList();
                              }
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  dummyCategories[index].imgUrl,
                                  width: 30,
                                ),
                              ),
                              Text(
                                dummyCategories[index].name,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GridView.builder(
              itemCount: shownHomePageProducts.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemProduct(product: shownHomePageProducts[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
