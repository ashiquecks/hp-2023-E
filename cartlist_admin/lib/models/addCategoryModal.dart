class AddCategoryModal {
  AddCategoryModal({
    required this.success,
    required this.message,
    required this.categoryData,
  });

  String success;
  String message;
  CategoryData categoryData;

  factory AddCategoryModal.fromJson(Map<String, dynamic> json) =>
      AddCategoryModal(
        success: json["success"],
        message: json["message"],
        categoryData: CategoryData.fromJson(json["category data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "category data": categoryData.toJson(),
      };
}

class CategoryData {
  CategoryData({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.subcategory,
  });

  String categoryId;
  String categoryName;
  String categoryImage;
  String subcategory;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        subcategory: json["subcategory"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "subcategory": subcategory,
      };
}
