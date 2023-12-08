import 'dart:convert';
import 'dart:io';
import 'package:cartlist/HELPER/categoryNetworkResponse.dart';
import 'package:cartlist/MODAL/updateCartModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<NetworkResponse<UpdateCartModal>> updateToCartData({
  required BuildContext context,
  required String productQuantity,
  required String cartID,
}) async {
  try {
    final data = http.MultipartRequest('POST',
        Uri.parse('http://18.183.210.225//cartlist_api/updateCart.php'));
    data.fields.addAll({
      'pass_productquantity': productQuantity,
      'pass_cartid': cartID,
    });

    http.StreamedResponse response = await data.send();

    if (response.statusCode == 200) {
      final responsString = json.decode(await response.stream.bytesToString());

      UpdateCartModal updateCartDatamodal =
          UpdateCartModal.fromJson(responsString);

      return NetworkResponse(true, updateCartDatamodal,
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
