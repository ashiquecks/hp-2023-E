import 'dart:convert';

List<SearchAllProduct> searchAllProductFromJson(String str) =>
    List<SearchAllProduct>.from(
        json.decode(str).map((x) => SearchAllProduct.fromJson(x)));

String searchAllProductToJson(List<SearchAllProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAllProduct {
  SearchAllProduct({
    required this.productId,
    required this.productName,
    required this.productBrand,
    required this.productImage,
    required this.productCategory,
    required this.subCategory,
    required this.quantityCategory,
    required this.amzone,
    required this.flipkart,
  });

  String productId;
  String productName;
  String productBrand;
  String productImage;
  String productCategory;
  String subCategory;
  String quantityCategory;
  String amzone;
  String flipkart;

  factory SearchAllProduct.fromJson(Map<String, dynamic> json) =>
      SearchAllProduct(
        productId: json["product_id"],
        productName: json["product_name"],
        productBrand: json["product_brand"],
        productImage: json["product_image"],
        productCategory: json["product_category"],
        subCategory: json["sub_category"],
        quantityCategory: json["quantity_category"],
        amzone: json["amzone"],
        flipkart: json["flipkart"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_brand": productBrand,
        "product_image": productImage,
        "product_category": productCategory,
        "sub_category": subCategory,
        "quantity_category": quantityCategory,
        "amzone": amzone,
        "flipkart": flipkart,
      };
}
