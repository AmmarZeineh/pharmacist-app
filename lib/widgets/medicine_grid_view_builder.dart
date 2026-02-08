import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/medicine_model.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/widgets/medicine_container.dart';

class MedicineGridViewBuilder extends StatelessWidget {
  const MedicineGridViewBuilder(
      {super.key,
      required this.searchText,
      required this.medicinesList,
      required this.pharmacistModel});

  final List<MedicineModel> medicinesList;
  final PharmacistModel? pharmacistModel;
  final String? searchText;

  @override
  Widget build(BuildContext context) {
    List<MedicineModel> searchMedicineList = [];
    for (int i = 0; i < medicinesList.length; i++) {
      if (searchText == null) {
        searchMedicineList = medicinesList;
        break;
      }
      if (medicinesList[i]
          .commercialName
          .toLowerCase()
          .contains(searchText!.toLowerCase())) {
        searchMedicineList.add(medicinesList[i]);
      }
    }
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 15,
            childAspectRatio: (size.height * 0.334 / size.width)),
        itemBuilder: (context, index) {
          return MedicineContainer(
            medicineModel: searchMedicineList[index],
            pharmacistModel: pharmacistModel,
          );
        },
        itemCount: searchMedicineList.length,
      ),
    );
  }
}
