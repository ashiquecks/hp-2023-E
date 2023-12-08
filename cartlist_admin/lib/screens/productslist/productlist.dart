import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartlist_admin/models/productModal.dart';
import 'package:cartlist_admin/provider/productProvider.dart';
import 'package:cartlist_admin/screens/updateproduct/updateProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    var providerProduct = Provider.of<ProductProvider>(context);
    return WillPopScope(
      onWillPop: (() async {
        providerProduct.postList.clear();
        return true;
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
        ),
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: providerProduct.postList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MediaQuery.of(context).size.height / 5.8,
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            ProductModal modalResponse = providerProduct.getPostByIndex(index);
            return SizedBox(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: ListTile(
                    onTap: () {},
                    leading: CachedNetworkImage(
                      imageUrl: modalResponse.productImage,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/placeholder.jpg'),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(modalResponse.productName),
                    subtitle: Text(
                      modalResponse.productBrand,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: ElevatedButton(
                      child: const Text("Edite"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProduct(
                              amzone: modalResponse.amzone,
                              categoryName: modalResponse.productCategory,
                              flipkart: modalResponse.flipkart,
                              productBrand: modalResponse.productBrand,
                              productID: modalResponse.productId,
                              productImage: modalResponse.productImage,
                              productName: modalResponse.productName,
                              quantityCategory: modalResponse.quantityCategory,
                              subCategoryName: modalResponse.subCategory,
                            ),
                          ),
                        );
                      },
                    ),
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
