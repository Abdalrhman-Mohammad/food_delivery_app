import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/views/pages/details_page.dart';

class ItemProduct extends StatefulWidget {
  final Product product;
  const ItemProduct({super.key, required this.product});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(product: widget.product),
          ),
        ).then((value) => setState(() {}));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            color: AppColors.white,
            shadowColor: AppColors.primary,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      widget.product.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.product.category.name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "\$ ${widget.product.price}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: null,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        if (!favoriteProducts.contains(widget.product)) {
                          favoriteProducts.add(widget.product);
                        } else {
                          favoriteProducts.remove(widget.product);
                        }
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Icon(
                      favoriteProducts.contains(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
