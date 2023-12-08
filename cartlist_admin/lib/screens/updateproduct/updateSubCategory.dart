import 'package:cartlist_admin/models/subCategoryModal.dart';
import 'package:cartlist_admin/provider/subCategoryProvider.dart';
import 'package:cartlist_admin/screens/updateproduct/updateProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateSubCategory extends StatefulWidget {
  final String productID;
  final String productName;
  final String productImage;
  final String productBrand;
  final String categoryName;
  final String subCategoryName;
  final String quantityCategory;
  final String amzone;
  final String flipkart;
  const UpdateSubCategory({
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
  State<UpdateSubCategory> createState() => _UpdateSubCategoryState();
}

class _UpdateSubCategoryState extends State<UpdateSubCategory> {
  @override
  Widget build(BuildContext context) {
    var providerSubCategory = Provider.of<SubCategoryProvider>(context);
    return WillPopScope(
      onWillPop: (() async {
        providerSubCategory.postList.clear();
        return true;
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sub Category"),
        ),
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: providerSubCategory.postList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MediaQuery.of(context).size.height / 5.8,
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            SubCategoryModal modalResponse =
                providerSubCategory.getPostByIndex(index);
            return SizedBox(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: ListTile(
                    onTap: () {
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
                            categoryName: widget.categoryName,
                            subCategoryName: modalResponse.subcategoryId,
                          ),
                        ),
                      );
                    },
                    title: Text(modalResponse.subcategoryName),
                    subtitle: Text(
                      modalResponse.subcategoryId,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Text(modalResponse.categoryName),
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
