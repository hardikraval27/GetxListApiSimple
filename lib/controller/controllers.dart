import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_list.dart';

class HomeController extends GetxController {
  var postList = <Data>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchrest();
  }

  Future<void> fetchrest() async {
    isLoading.value = true;
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    final responsed = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responsed);
      postList.addAll(
          List.from(responsed['data']).map((e) => Data.fromJson(e)).toList());
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Server responsed:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
