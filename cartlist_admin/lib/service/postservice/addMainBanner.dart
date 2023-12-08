import 'dart:convert';
import 'dart:io';
import 'package:cartlist_admin/HELPER/categoryNetworkResponse.dart';
import 'package:cartlist_admin/models/addBannerModal.dart';
import 'package:http/http.dart' as http;

class AddMainBannerservice {
  static Future<NetworkResponse<AddBannerModal>> addMainBanner({
    required String bannerLink,
    required String bannerImage,
    required String description,
  }) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://18.183.210.225/cartlistapp_api/admin/post_data/add_mainbanner.php'));
      request.fields.addAll({
        'bannerImage': bannerImage,
        'bannerLink': bannerLink,
        'bannerDescription': description
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonString = jsonDecode(await response.stream.bytesToString());

        AddBannerModal bannerDatamodal = AddBannerModal.fromJson(jsonString);

        return NetworkResponse(true, bannerDatamodal,
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
