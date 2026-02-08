import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/models/medicine_model.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';

class MedicineContainer extends StatefulWidget {
  const MedicineContainer(
      {super.key, required this.medicineModel, required this.pharmacistModel});

  final MedicineModel medicineModel;
  final PharmacistModel? pharmacistModel;

  @override
  State<MedicineContainer> createState() => _MedicineContainerState();
}

class _MedicineContainerState extends State<MedicineContainer> {
  final int random = Random().nextInt(4);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, kDetailsScreen, arguments: [
          widget.medicineModel,
          colorsList[random],
          imageList[random],
          widget.pharmacistModel
        ]);
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorsList[random], borderRadius: BorderRadius.circular(16)),
        height: 250,
        width: 200,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              bottom: 85,
              right: 5,
              child: Image.asset(
                imageList[random],
                height: 160,
              ),
            ),
            Positioned(
              bottom: 60,
              left: 15,
              child: Text(
                widget.medicineModel.commercialName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 15,
              child: Text(
                widget.medicineModel.scientificName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Text(
                '${widget.medicineModel.price}\$',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
