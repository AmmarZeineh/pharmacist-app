import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/api.dart';
import 'package:pharmacy_app/models/medicine_model.dart';

part 'get_medicine_state.dart';

class GetMedicineCubit extends Cubit<GetMedicineState> {
  GetMedicineCubit() : super(GetMedicineInitial());

  getAllMedicines() async {
    List<dynamic> data = await Api()
        .get(url: '$baseUrl/api/medecine/showMedicines', token: null);

    List<MedicineModel> medicinesList = [];
    for (var i = 0; i < data.length; i++) {
      medicinesList.add(MedicineModel.fromJson(data[i]));
    }
    emit(GetMedicineSuccess());
    return medicinesList;
  }

  getMedicinesByCategory(id) async {
    List<dynamic> data = await Api().post(
        body: {'category_id': id},
        url: '$baseUrl/api/medecine/getMedicinesByCategory',
        token: null);

    List<MedicineModel> medicinesByIdList = [];
    for (var i = 0; i < data.length; i++) {
      medicinesByIdList.add(MedicineModel.fromJson(data[i]));
    }
    emit(GetMedicineSuccess());
    return medicinesByIdList;
  }
}
