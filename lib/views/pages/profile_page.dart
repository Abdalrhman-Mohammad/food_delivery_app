import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/views/weidgets/profile_buttons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Card(
                  elevation: 0,
                  color: AppColors.lightGrey,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      const VerticalDivider(
                        color: AppColors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Person",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Text("someth123@gmail.com"),
                          const Text("0123456789"),
                        ],
                      )
                    ],
                  )),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrey,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.favorite_outline),
                                ),
                              ),
                            ),
                            Text("Favorite"),
                          ],
                        ),
                      )),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightGrey,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.attach_money),
                              ),
                            ),
                          ),
                          Text("Money"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ProfileButton(
              leftIcon: const Icon(Icons.upgrade),
              title: "App update avalilable",
              additional: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                  child: Text(
                    "v17.42.1",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ProfileButton(
              leftIcon: const Icon(Icons.person_outline),
              title: "Your Profile",
              additional: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                  child: Text(
                    "32% completed",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ProfileButton(
              leftIcon: Icon(Icons.message_outlined),
              title: "Channel",
              additional: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14),
                  child: Text(
                    "New",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const ProfileButton(
              leftIcon: Icon(Icons.food_bank_outlined),
              title: "Food Orders",
            ),
            const SizedBox(height: 8),
            const ProfileButton(
              leftIcon: Icon(Icons.money_outlined),
              title: "Money",
            ),
            const SizedBox(height: 8),
            ProfileButton(
              leftIcon: Image.asset("assets/images/coupon.png", width: 25),
              title: "Coupouns",
            ),
          ],
        ),
      ),
    );
  }
}
