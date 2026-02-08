import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pharmacistModel});
  final PharmacistModel pharmacistModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Hello,',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Text(
            ' ${pharmacistModel.name}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      elevation: 0,
      forceMaterialTransparency: true,
    );
  }
}
