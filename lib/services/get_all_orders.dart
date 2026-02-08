import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/api.dart';
import 'package:pharmacy_app/models/order_model.dart';

class GetAllOrders {
  getAllOrders(pharmacistId) async {
    dynamic data = await Api().post(
        url: '$baseUrl/api/pharmacist/viewOrders',
        body: {'pharmacist_id': pharmacistId.toString()},
        token: null);
    List<OrderModel> ordersList = [];
    for (var i = 0; i < data['orders'].length; i++) {
      ordersList.add(OrderModel.fromJson(data, i));
    }
    return ordersList;
  }
}
