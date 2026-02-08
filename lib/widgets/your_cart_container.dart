import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';

class YourCartWidget extends StatelessWidget {
  const YourCartWidget({super.key, required this.pharmacistModel});
  final PharmacistModel pharmacistModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
          color: kWidgetColor, borderRadius: BorderRadius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -10,
            bottom: 10,
            child: Image.asset(
              'assets/images/home_photo.jpg',
              height: 190,
            ),
          ),
          const Positioned(
            bottom: 110,
            right: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We will provide',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  'Medicines for you',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              right: 210,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, kCartScreen,
                    arguments: pharmacistModel),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  height: 50,
                  child: const Center(
                      child: Text(
                    'Your cart',
                    style: TextStyle(
                        color: kWidgetColor, fontWeight: FontWeight.bold),
                  )),
                ),
              )),
        ],
      ),
    );
  }
}
