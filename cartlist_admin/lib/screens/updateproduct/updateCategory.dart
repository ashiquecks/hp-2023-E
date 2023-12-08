import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartlist_admin/models/categoryModal.dart';
import 'package:cartlist_admin/provider/categoryProvider.dart';
import 'package:cartlist_admin/provider/subCategoryProvider.dart';
import 'package:cartlist_admin/screens/updateproduct/updateProduct.dart';
import 'package:cartlist_admin/screens/updateproduct/updateSubCategory.dart';
import 'package:cartlist_admin/service/getservice/getSubCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCategory extends StatefulWidget {
  final String productID;
  final String productName;
  final String productImage;
  final String productBrand;
  final String categoryName;
  final String subCategoryName;
  final String quantityCategory;
  final String amzone;
  final String flipkart;
  const UpdateCategory({
    super.key,
    required this.categoryName,
    required this.subCategoryName,
    required this.productID,
    required this.productName,
    required this.productImage,
    required this.productBrand,
    required this.quantityCategory,
    required this.amzone,
    required this.flipkart,
  });

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  getSubCategoryResponse(
      {required BuildContext context, required String categoryId}) async {
    var provider = Provider.of<SubCategoryProvider>(context, listen: false);
    var response = await GetSubCategoryservice.getSubCategoryResponse(
        categoryID: categoryId);

    if (response.isSuccessful!) {
      provider.setPostList(response.data!);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var providerCategory = Provider.of<CategoryProvider>(context);
    return WillPopScope(
      onWillPop: (() async {
        return true;
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Category"),
        ),
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: providerCategory.postList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MediaQuery.of(context).size.height / 5.8,
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            CategoryModal modalResponse =
                providerCategory.getPostByIndex(index);
            return SizedBox(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      if (modalResponse.subcategory == "true") {
                        getSubCategoryResponse(
                            context: context,
                            categoryId: modalResponse.categoryId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateSubCategory(
                              productName: widget.productName,
                              productBrand: widget.productBrand,
                              productImage: widget.productImage,
                              quantityCategory: widget.quantityCategory,
                              amzone: widget.amzone,
                              flipkart: widget.flipkart,
                              productID: widget.productID,
                              categoryName: modalResponse.categoryId,
                              subCategoryName: widget.subCategoryName,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProduct(
                              productName: widget.productName,
                              productBrand: widget.productBrand,
                              productImage: widget.productImage,
                              quantityCategory: widget.quantityCategory,
                              amzone: widget.amzone,
                              flipkart: widget.flipkart,
                              productID: widget.productID,
                              categoryName: modalResponse.categoryId,
                              subCategoryName: widget.subCategoryName,
                            ),
                          ),
                        );
                      }
                    },
                    leading: CachedNetworkImage(
                      imageUrl: modalResponse.categoryImage,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/placeholder.jpg'),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(modalResponse.categoryName),
                    subtitle: Text(
                      modalResponse.categoryId,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Text(modalResponse.subcategory),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
