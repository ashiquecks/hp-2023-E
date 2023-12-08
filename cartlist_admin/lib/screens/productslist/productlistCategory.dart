import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartlist_admin/models/categoryModal.dart';
import 'package:cartlist_admin/provider/categoryProvider.dart';
import 'package:cartlist_admin/provider/productProvider.dart';
import 'package:cartlist_admin/provider/subCategoryProvider.dart';
import 'package:cartlist_admin/screens/productslist/productlist.dart';
import 'package:cartlist_admin/screens/productslist/productlistSubcategory.dart';
import 'package:cartlist_admin/service/getservice/getProduct.dart';
import 'package:cartlist_admin/service/getservice/getSubCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListCategory extends StatefulWidget {
  const ProductListCategory({super.key});

  @override
  State<ProductListCategory> createState() => _ProductListCategoryState();
}

class _ProductListCategoryState extends State<ProductListCategory> {
  getSubCategoryResponse(
      {required BuildContext context, required String categoryId}) async {
    var provider = Provider.of<SubCategoryProvider>(context, listen: false);
    var response = await GetSubCategoryservice.getSubCategoryResponse(
        categoryID: categoryId);

    if (response.isSuccessful!) {
      provider.setPostList(response.data!);
    } else {}
  }

  // Product Response Post To Product Provider
  postProductResponse({required String productCategory}) async {
    var provider = Provider.of<ProductProvider>(context, listen: false);
    var response = await Productservice.getProductResponse(productCategory);

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
                      if (modalResponse.subcategory == 'false') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductList()));
                        postProductResponse(
                            productCategory: modalResponse.categoryId);
                      } else {
                        getSubCategoryResponse(
                            context: context,
                            categoryId: modalResponse.categoryId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductlistSubcategory()));
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
