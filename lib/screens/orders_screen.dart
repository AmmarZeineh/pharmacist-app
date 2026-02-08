import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/models/order_model.dart';
import 'package:pharmacy_app/widgets/order_container.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const id = kOrdersScreen;

  @override
  Widget build(BuildContext context) {
    List<OrderModel> ordersList =
        ModalRoute.of(context)!.settings.arguments as List<OrderModel>;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrderContainer(
            orderModel: ordersList[index],
          );
        },
        itemCount: ordersList.length,
      ),
    );
  }
}
