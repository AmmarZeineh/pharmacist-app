import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/medicine_model.dart';

class CartModel {
  final MedicineModel medicineModel;
  final int quantity;

  final String image;
  final Color color;

  CartModel(
      {required this.medicineModel,
      required this.quantity,
      required this.color,
      required this.image});
}
