import 'package:cartlist_admin/provider/categoryProvider.dart';
import 'package:cartlist_admin/service/getservice/getCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Category Response Post To Category Provider
getCategoryResponse({required BuildContext context}) async {
  var provider = Provider.of<CategoryProvider>(context, listen: false);
  var response = await Categoryservice.getCategoryResponse();

  if (response.isSuccessful!) {
    provider.setPostList(response.data!);
  } else {}
}
