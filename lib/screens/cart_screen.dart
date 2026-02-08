import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/cubits/cart%20model/cart_model_cubit.dart';
import 'package:pharmacy_app/cubits/theme%20cubit/theme_cubit.dart';

import 'package:pharmacy_app/helper/api.dart';
import 'package:pharmacy_app/helper/show_snack_bar.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/widgets/cart_medicine_container.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const id = kCartScreen;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    PharmacistModel pharmacistModel =
        ModalRoute.of(context)!.settings.arguments as PharmacistModel;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'My Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CartMedicineContainer(
                          cartModel: BlocProvider.of<CartCubit>(context)
                              .cartModelsList[index],
                        ),
                      );
                    },
                    itemCount: BlocProvider.of<CartCubit>(context)
                        .cartModelsList
                        .length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: CustomButton(
                  onTap: () {
                    try {
                      for (int i = 0;
                          i <
                              BlocProvider.of<CartCubit>(context)
                                  .cartModelsList
                                  .length;
                          i++) {
                        Api().post(
                            url: '$baseUrl/api/order/createOrder',
                            body: {
                              'order_items[$i][commercial_name]':
                                  BlocProvider.of<CartCubit>(context)
                                      .cartModelsList[i]
                                      .medicineModel
                                      .commercialName,
                              'order_items[$i][quantity]':
                                  BlocProvider.of<CartCubit>(context)
                                      .cartModelsList[i]
                                      .quantity
                                      .toString(),
                              'pharmacist_id': pharmacistModel.id.toString(),
                              'owner_id': BlocProvider.of<CartCubit>(context)
                                  .cartModelsList[i]
                                  .medicineModel
                                  .ownerId
                                  .toString()
                            },
                            token: null);
                      }
                      showSnackBar(context, 'Your order has been received');
                      BlocProvider.of<CartCubit>(context)
                          .cartModelsList
                          .clear();
                      setState(() {});
                    } on Exception catch (e) {
                      showSnackBar(context, e.toString());
                    }
                  },
                  hint: 'Order',
                  hintColor: BlocProvider.of<ThemeCubit>(context).theme ==
                          Brightness.light
                      ? Colors.white
                      : Colors.black,
                  buttonColor: BlocProvider.of<ThemeCubit>(context).theme ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
