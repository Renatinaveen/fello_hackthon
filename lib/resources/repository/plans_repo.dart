import 'package:fello_hackthon/resources/api_client.dart';
import 'package:fello_hackthon/resources/constants.dart';
import 'package:flutter/foundation.dart';

class PlansRepo {
  final ApiClient _apiClient = ApiClient();

  Future fetchPlans() async {
    try {
      final response = await _apiClient.get(Constants.savingsPlans);
      if (kDebugMode) {
        print('response: $response');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchExistingPlans() async {
    var existingPlans = {
      "plans": [
        {
          "name": "My First Plan",
          "lottie_file":
              "https://firebasestorage.googleapis.com/v0/b/fello-hackthon.appspot.com/o/car_lottie.json?alt=media&token=e37acfce-26e6-458d-a190-9988ca44b58e",
          "amount": 10000,
          "duration": 12,
          "interest": 10,
          "startDate": "2021-09-01",
          "endDate": "2022-09-01",
          "status": "active",
          "payments": [
            {"date": "2021-09-01", "amount": 10000, "status": "paid"},
            {"date": "2021-10-01", "amount": 10000, "status": "paid"},
            {"date": "2021-11-01", "amount": 10000, "status": "paid"},
            {"date": "2021-12-01", "amount": 10000, "status": "paid"},
            {"date": "2022-01-01", "amount": 10000, "status": "paid"},
            {"date": "2022-02-01", "amount": 10000, "status": "paid"}
          ]
        },
        {
          "name": "My First Plan",
          "lottie_file":
              "https://firebasestorage.googleapis.com/v0/b/fello-hackthon.appspot.com/o/house_lottie.json?alt=media&token=d1f592ae-1047-4fb5-8f41-a92e0d50a769",
          "amount": 10000,
          "duration": 6,
          "interest": 10,
          "startDate": "2021-09-01",
          "endDate": "2022-09-01",
          "status": "completed",
          "payments": [
            {"date": "2021-09-01", "amount": 10000, "status": "paid"},
            {"date": "2021-10-01", "amount": 10000, "status": "paid"},
            {"date": "2021-11-01", "amount": 10000, "status": "paid"},
            {"date": "2021-12-01", "amount": 10000, "status": "paid"},
            {"date": "2022-01-01", "amount": 10000, "status": "paid"},
            {"date": "2022-02-01", "amount": 10000, "status": "paid"}
          ]
        },
      ]
    };
    return existingPlans;
  }
}
