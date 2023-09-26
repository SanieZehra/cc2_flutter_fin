import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsController extends GetxController {
  RxList<String> termsData = <String>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    callTerms();
  }

  Future<void> callTerms() async {
    try {
      final response = await http.get(
        Uri.parse("https://baconipsum.com/api/?type=meat-and-filler"),
      );

      if (response.statusCode == 200) {
        final List<String> data = response.body.split('\n');
        termsData.assignAll(data);
        log(response.body);
        isLoading.value = false;
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

