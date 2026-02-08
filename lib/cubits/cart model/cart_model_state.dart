part of 'cart_model_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccessMedicine extends CartState {}

final class CartDeleteMedicine extends CartState {}
