import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart' as constants;

class ProfileApiService{
  Future<http.Response> getProfileData() async {

    http.Response response;
    try {
      response = await http.get(
        Uri.https(constants.baseAPIUrl, 'api/v2/users'),
      ).timeout(const Duration(seconds: 60), onTimeout: () {
        if (kDebugMode) {
          print("api timeout");
        }
        return http.Response(
          'timeout',
          408,
        );
      });
    }
    on SocketException {
      if (kDebugMode) {
        print('No Internet connection');
      }
      return http.Response(
        'No Internet connection',
        200,
      );
    }

    return response;

  }

}