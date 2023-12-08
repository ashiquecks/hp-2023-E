class SubCategoryModal {
  SubCategoryModal({
    required this.subcategoryId,
    required this.subcategoryName,
    required this.categoryName,
  });

  String subcategoryId;
  String subcategoryName;
  String categoryName;

  factory SubCategoryModal.fromJson(Map<String, dynamic> json) =>
      SubCategoryModal(
        subcategoryId: json["subcategory_id "],
        subcategoryName: json["subcategory_name"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "subcategory_id ": subcategoryId,
        "subcategory_name": subcategoryName,
        "category_name": categoryName,
      };
}
