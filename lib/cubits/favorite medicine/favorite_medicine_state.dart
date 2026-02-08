part of 'favorite_medicine_cubit.dart';

@immutable
sealed class FavoriteMedicineState {}

final class FavoriteMedicineInitial extends FavoriteMedicineState {}

final class FavoriteMedicineSuccess extends FavoriteMedicineState {}
