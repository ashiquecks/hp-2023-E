import 'dart:convert';
import 'dart:io';
import 'package:cartlist/HELPER/categoryNetworkResponse.dart';
import 'package:cartlist/MODAL/authenticationModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static Future<NetworkResponse<AuthenticatonModal>> authentication({
    required BuildContext context,
    required String userName,
    required String phoneNumber,
    required String userLat,
    required String userLong,
  }) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://18.183.210.225/cartlistapp_api/user/post_data/create_user.php'));
      request.fields.addAll({
        'userName': userName,
        'userPhone': phoneNumber,
        'userLat': userLat,
        'userLong': userLong,
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responsString = jsonDecode(await response.stream.bytesToString());

        AuthenticatonModal authenticatonModal =
            AuthenticatonModal.fromJson(responsString);

        return NetworkResponse(true, authenticatonModal,
            responseCode: response.statusCode);
      } else {
        return NetworkResponse(false, null,
            message:
                'Invalid response recived from server! please try again in a minutes or two',
            responseCode: response.statusCode);
      }
    } on SocketException {
      return NetworkResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Ple ase try again in  a minutes or two",
      );
    } on FormatException {
      return NetworkResponse(
        false,
        null,
        message:
            "Invalid response receved form the server! Please try again in a minutes or two",
      );
    } catch (e) {
      return NetworkResponse(false, null,
          message: 'somthing went wrong please try again in a minute or two');
    }
    throw Exception('Unexpected error occured!');
  }
}
