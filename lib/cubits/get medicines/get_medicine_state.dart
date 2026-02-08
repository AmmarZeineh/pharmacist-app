part of 'get_medicine_cubit.dart';

@immutable
sealed class GetMedicineState {}

final class GetMedicineInitial extends GetMedicineState {}

final class GetMedicineSuccess extends GetMedicineState {}
