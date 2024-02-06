import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String imgUrl;
  final VoidCallback onTap;
  Category({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.onTap,
  });
}

List<Category> dummyCategories = [
  Category(
    id: '1',
    name: 'Burger',
    imgUrl: 'assets/images/burger.png',
    onTap: () {},
  ),
  Category(
    id: '2',
    name: 'Chicken',
    imgUrl: 'assets/images/chicken-leg.png',
    onTap: () {},
  ),
  Category(
    id: '3',
    name: 'Coke',
    imgUrl: 'assets/images/coke.png',
    onTap: () {},
  ),
  Category(
    id: '4',
    name: 'Drink',
    imgUrl: 'assets/images/drink.png',
    onTap: () {},
  ),
  Category(
    id: '5',
    name: 'Taco',
    imgUrl: 'assets/images/tacos.png',
    onTap: () {},
  ),
];
