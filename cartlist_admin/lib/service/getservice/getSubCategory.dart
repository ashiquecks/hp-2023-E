import 'dart:convert';
import 'dart:io';
import 'package:cartlist_admin/HELPER/categoryNetworkResponse.dart';
import 'package:cartlist_admin/models/subCategoryModal.dart';
import 'package:http/http.dart';

class GetSubCategoryservice {
  static Future<NetworkResponse<List<SubCategoryModal>>>
      getSubCategoryResponse({
    required String categoryID,
  }) async {
    try {
      final response = await get(Uri.parse(
          'http://18.183.210.225/cartlistapp_api/cartlist/get_data/getsubcategory_list.php?categoryID=$categoryID'));

      print(response.body);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<SubCategoryModal> subCategoryList = [];
        body.forEach((e) {
          SubCategoryModal suCategoryResponse = SubCategoryModal.fromJson(e);
          subCategoryList.add(suCategoryResponse);
        });
        return NetworkResponse(true, subCategoryList,
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
