import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/api.dart';

logout({required String token}) async {
  try {
    await Api()
        .post(url: '$baseUrl/api/pharmacist/logout', body: null, token: token);
  } catch (e) {
    throw Exception(e);
  }
}
