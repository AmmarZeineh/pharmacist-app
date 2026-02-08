import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:pharmacy_app/cubits/cart%20model/cart_model_cubit.dart';
import 'package:pharmacy_app/models/cart_model.dart';

class CartMedicineContainer extends StatefulWidget {
  const CartMedicineContainer({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  State<CartMedicineContainer> createState() => _CartMedicineContainerState();
}

class _CartMedicineContainerState extends State<CartMedicineContainer> {
  int? newQuantity;
  late int totalPrice;

  @override
  Widget build(BuildContext context) {
    if (newQuantity == null) {
      totalPrice = widget.cartModel.quantity *
          int.parse(widget.cartModel.medicineModel.price);
    } else {
      totalPrice =
          newQuantity! * int.parse(widget.cartModel.medicineModel.price);
    }
    return Container(
      decoration: BoxDecoration(
          color: widget.cartModel.color,
          borderRadius: BorderRadius.circular(20)),
      height: 150,
      width: 200,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            bottom: 10,
            right: 5,
            child: Image.asset(
              widget.cartModel.image,
              height: 135,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 15,
            child: Text(
              widget.cartModel.medicineModel.commercialName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 15,
            child: Text(
              widget.cartModel.medicineModel.scientificName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$totalPrice',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 120,
            child: InputQty.int(
              onQtyChanged: (value) {
                setState(() {
                  newQuantity = value;
                });
              },
              qtyFormProps: const QtyFormProps(
                  enableTyping: false,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              initVal: widget.cartModel.quantity == 0
                  ? 1
                  : widget.cartModel.quantity,
              decoration: const QtyDecorationProps(
                border: InputBorder.none,
                btnColor: Colors.white,
              ),
              minVal: 1,
              maxVal: int.parse(widget.cartModel.medicineModel.quantity),
            ),
          ),
          Positioned(
              bottom: 95,
              left: 5,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<CartCubit>(context)
                      .deleteMedicine(widget.cartModel);
                },
              )),
        ],
      ),
    );
  }
}
