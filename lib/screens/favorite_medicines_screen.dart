import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/cubits/favorite%20medicine/favorite_medicine_cubit.dart';
import 'package:pharmacy_app/models/medicine_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/widgets/medicine_grid_view_builder.dart';

class FavoriteMedicinesScreen extends StatefulWidget {
  const FavoriteMedicinesScreen({
    super.key,
  });
  static const id = kFavoriteScreen;

  @override
  State<FavoriteMedicinesScreen> createState() =>
      _FavoriteMedicinesScreenState();
}

class _FavoriteMedicinesScreenState extends State<FavoriteMedicinesScreen> {
  @override
  Widget build(BuildContext context) {
    PharmacistModel pharmacistModel =
        ModalRoute.of(context)!.settings.arguments as PharmacistModel;

    List<MedicineModel> favoriteMedicinesList =
        BlocProvider.of<FavoriteMedicineCubit>(context).favoriteMedicinesList;
    return BlocBuilder<FavoriteMedicineCubit, FavoriteMedicineState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Favorite',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: MedicineGridViewBuilder(
                pharmacistModel: pharmacistModel,
                medicinesList: favoriteMedicinesList,
                searchText: null,
              ),
            ));
      },
    );
  }
}
