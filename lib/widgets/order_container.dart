import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/models/order_model.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    int random = Random().nextInt(4);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            color: colorsList[random], borderRadius: BorderRadius.circular(20)),
        height: 150,
        width: 200,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              bottom: 10,
              right: 5,
              child: Image.asset(
                imageList[random],
                height: 135,
              ),
            ),
            Positioned(
              bottom: 100,
              left: 15,
              child: Text(
                orderModel.orderItems.commercialName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 75,
              left: 15,
              child: Text(
                'Quantity : ${orderModel.orderItems.quantity.toString()}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 45,
              left: 15,
              child: Text(
                'Status : ${orderModel.status}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Status : ${orderModel.paymentStatus}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
