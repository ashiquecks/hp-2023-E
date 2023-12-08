import 'dart:convert';
import 'dart:io';
import 'package:cartlist_admin/HELPER/categoryNetworkResponse.dart';
import 'package:cartlist_admin/models/addSubCategoryModal.dart';
import 'package:http/http.dart' as http;

class SubCategoryservice {
  static Future<NetworkResponse<AddSubCategoryModal>> addSubCategory({
    required String categoryID,
    required String subCategoryName,
  }) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://18.183.210.225/cartlistapp_api/admin/post_data/add_subcategory.php'));
      request.fields.addAll(
          {'categoryName': categoryID, 'subCategoryName': subCategoryName});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonString = jsonDecode(await response.stream.bytesToString());

        AddSubCategoryModal subCategoryDatamodal =
            AddSubCategoryModal.fromJson(jsonString);

        return NetworkResponse(true, subCategoryDatamodal,
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
