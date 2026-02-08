import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/models/cart_model.dart';

part 'cart_model_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cartModelsList = [];
  addNewMedicine(CartModel cartModel) {
    cartModelsList.add(cartModel);
    emit(CartSuccessMedicine());
  }

  deleteMedicine(CartModel cartModel) {
    cartModelsList.remove(cartModel);
    emit((CartDeleteMedicine()));
  }
}
