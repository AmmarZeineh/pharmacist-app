import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:pharmacy_app/models/medicine_model.dart';

part 'favorite_medicine_state.dart';

class FavoriteMedicineCubit extends Cubit<FavoriteMedicineState> {
  FavoriteMedicineCubit() : super(FavoriteMedicineInitial());
  List<MedicineModel> favoriteMedicinesList = [];
  addToFavorite(MedicineModel medicineModel) {
    favoriteMedicinesList.add(medicineModel);
    emit(FavoriteMedicineSuccess());
  }

  removeFromFavorite(MedicineModel medicineModel) {
    favoriteMedicinesList.remove(medicineModel);
    emit(FavoriteMedicineSuccess());
  }
}
