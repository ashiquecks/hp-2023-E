import 'package:cartlist_admin/models/productModal.dart';
import 'package:flutter/cupertino.dart';

class SubProductProvider extends ChangeNotifier {
  List<ProductModal> _productList = [];

  List<ProductModal> get postList => _productList;

  setPostList(List<ProductModal> list) {
    _productList.addAll(list);
    notifyListeners();
  }

  mergePostList(List<ProductModal> list) {
    _productList = list;
    notifyListeners();
  }

  ProductModal getPostByIndex(int index) => _productList[index];
}
