class AddSubCategoryModal {
  AddSubCategoryModal({
    required this.success,
    required this.message,
    required this.subcategoryData,
  });

  String success;
  String message;
  addSubcategoryData subcategoryData;

  factory AddSubCategoryModal.fromJson(Map<String, dynamic> json) =>
      AddSubCategoryModal(
        success: json["success"],
        message: json["message"],
        subcategoryData: addSubcategoryData.fromJson(json["subcategory data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "subcategory data": subcategoryData.toJson(),
      };
}

class addSubcategoryData {
  addSubcategoryData({
    required this.subcategoryId,
    required this.subcategoryName,
    required this.categoryName,
  });

  String subcategoryId;
  String subcategoryName;
  String categoryName;

  factory addSubcategoryData.fromJson(Map<String, dynamic> json) =>
      addSubcategoryData(
        subcategoryId: json["subcategory_id"],
        subcategoryName: json["subcategory_name"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "subcategory_id": subcategoryId,
        "subcategory_name": subcategoryName,
        "category_name": categoryName,
      };
}
