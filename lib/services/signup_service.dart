import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/api.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';

signUp({required dynamic body}) async {
  dynamic data = await Api()
      .post(url: '$baseUrl/api/pharmacist/register', body: body, token: null);
  PharmacistModel pharmacistModel = PharmacistModel.fromJson(data);
  return pharmacistModel;
}
