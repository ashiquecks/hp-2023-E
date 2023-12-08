import 'package:cartlist_admin/models/subCategoryModal.dart';
import 'package:flutter/cupertino.dart';

class SubCategoryProvider extends ChangeNotifier {
  List<SubCategoryModal> _subCategoryList = [];

  List<SubCategoryModal> get postList => _subCategoryList;

  setPostList(List<SubCategoryModal> list) {
    _subCategoryList.addAll(list);
    notifyListeners();
  }

  mergePostList(List<SubCategoryModal> list) {
    _subCategoryList = list;
    notifyListeners();
  }

  SubCategoryModal getPostByIndex(int index) => _subCategoryList[index];
}
