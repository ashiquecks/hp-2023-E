import 'package:cartlist_admin/models/subCategoryModal.dart';
import 'package:cartlist_admin/provider/subCategoryProvider.dart';
import 'package:cartlist_admin/provider/subProductProvider.dart';
import 'package:cartlist_admin/screens/productslist/subcategoryProduct.dart';
import 'package:cartlist_admin/service/getservice/getSubCategoryProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductlistSubcategory extends StatefulWidget {
  const ProductlistSubcategory({super.key});

  @override
  State<ProductlistSubcategory> createState() => _ProductlistSubcategoryState();
}

class _ProductlistSubcategoryState extends State<ProductlistSubcategory> {
  // Product Response Post To Product Provider
  postProductResponseSub({required String productSubCategoryID}) async {
    var provider = Provider.of<SubProductProvider>(context, listen: false);
    var response =
        await ProductserviceSubCategory.getSubCategoryProductResponse(
            subCategoryID: productSubCategoryID);

    if (response.isSuccessful!) {
      provider.setPostList(response.data!);
    } else if (response.message ==
        "Unable to reach the internet! Ple ase try again in  a minutes or two") {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/lossConnection');
    } else {}
  }

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
                              builder: (context) => SubcategoryProduct()));
                      postProductResponseSub(
                          productSubCategoryID: modalResponse.subcategoryId);
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
