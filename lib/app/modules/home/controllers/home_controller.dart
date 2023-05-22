import 'dart:convert';

import 'package:codixel_test/app/data/api_service/api_service.dart';
import 'package:codixel_test/app/models/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/internet_connectivity_service.dart';

class HomeController extends GetxController {

  var isLoading = false.obs;
  var isEmpty = false.obs;

  final model = Profile().obs;

  @override
  void onInit() {
    super.onInit();
    isEmpty.value = true;
  }

  void getProfileAPIData() async {
    model.value = Profile();

    isEmpty.value = false;
    isLoading.value = true;

    if (await InternetService().hasActiveInternet() == false) {
      Get.snackbar(
        'Please check your internet connection'.tr, '',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 3000),
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return;
    }

    var response = await ProfileApiService().getProfileData();

    try{
      if (response.statusCode == 200) {
          model.value = Profile.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Something went wrong', '',
          colorText: Colors.red,
          backgroundColor: Colors.grey[800],
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 3000),
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } catch (ex) {
      print("API Fetch : Failed");
    } finally {
      isLoading(false);
    }
  }

}
