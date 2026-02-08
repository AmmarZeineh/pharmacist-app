// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/cubits/cart%20model/cart_model_cubit.dart';
import 'package:pharmacy_app/cubits/favorite%20medicine/favorite_medicine_cubit.dart';
import 'package:pharmacy_app/helper/api.dart';
import 'package:pharmacy_app/helper/show_snack_bar.dart';
import 'package:pharmacy_app/models/cart_model.dart';
import 'package:pharmacy_app/models/medicine_model.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';

class MedicineDetailsScreen extends StatefulWidget {
  const MedicineDetailsScreen({super.key});

  static const id = kDetailsScreen;

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    var size = MediaQuery.of(context).size;
    Color color = arguments[1];
    String image = arguments[2];
    MedicineModel medicineModel = arguments[0];
    PharmacistModel pharmacistModel = arguments[3];
    final String category;

    if (medicineModel.categoryId == 1)
      category = 'PainKiller';
    else if (medicineModel.categoryId == 2)
      category = 'Antipyretics';
    else if (medicineModel.categoryId == 3)
      category = 'Analgesics';
    else if (medicineModel.categoryId == 4)
      category = 'Antimalarial';
    else if (medicineModel.categoryId == 5)
      category = 'Antibiotics';
    else if (medicineModel.categoryId == 6)
      category = 'Antiseptics';
    else
      category = 'Depressants';

    return Scaffold(
      backgroundColor: color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: size.height - (size.height / 2),
              ),
              Positioned(
                left: 30,
                bottom: 355,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                bottom: 355,
                child: IconButton(
                  onPressed: () {
                    if (BlocProvider.of<FavoriteMedicineCubit>(context)
                        .favoriteMedicinesList
                        .contains(medicineModel)) {
                      Api().post(
                          url:
                              '$baseUrl/api/pharmacist/${pharmacistModel.id}/removeFromFavorites/${medicineModel.medicineId}',
                          body: null,
                          token: null);
                      setState(() {});
                      BlocProvider.of<FavoriteMedicineCubit>(context)
                          .removeFromFavorite(medicineModel);
                      setState(() {});
                    } else {
                      Api().post(
                          url:
                              '$baseUrl/api/pharmacist/${pharmacistModel.id}/addToFavorites/${medicineModel.medicineId}',
                          body: null,
                          token: null);
                      setState(() {});
                      BlocProvider.of<FavoriteMedicineCubit>(context)
                          .addToFavorite(medicineModel);
                    }
                  },
                  icon: Icon(
                    BlocProvider.of<FavoriteMedicineCubit>(context)
                            .favoriteMedicinesList
                            .contains(medicineModel)
                        ? Icons.favorite
                        : Icons.favorite_border_sharp,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  medicineModel.commercialName,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Column(
                  children: [
                    Text(
                      '($category)',
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'owner id : ${medicineModel.ownerId}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              medicineModel.scientificName,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 12),
            child: Text(
              '\$${medicineModel.price}',
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 27, top: 16),
            child: Text(
              'The Manufacture Company :',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              medicineModel.theManufactureCompany,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27, top: 16),
            child: Row(
              children: [
                const Text(
                  'Expire Date :  ',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  medicineModel.expiryDate,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: size.width / 300),
            child: Column(
              children: [
                InputQty.int(
                  qtyFormProps: const QtyFormProps(
                      enableTyping: false,
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  onQtyChanged: (value) {
                    setState(() {
                      quantity = value;
                    });
                  },
                  initVal: 1,
                  decoration: const QtyDecorationProps(
                    border: InputBorder.none,
                    btnColor: Colors.white,
                  ),
                  minVal: 1,
                  maxVal: int.parse(medicineModel.quantity),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    buttonColor: Colors.white,
                    hint: 'Add To Cart',
                    hintColor: color,
                    onTap: () {
                      BlocProvider.of<CartCubit>(context).addNewMedicine(
                          CartModel(
                              medicineModel: medicineModel,
                              quantity: quantity == 0 ? 1 : quantity,
                              color: color,
                              image: image));
                      showSnackBar(context, 'Medicine Added Successfully');
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
