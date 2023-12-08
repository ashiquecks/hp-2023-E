import 'package:cartlist_admin/models/subCategoryModal.dart';
import 'package:cartlist_admin/provider/subCategoryProvider.dart';
import 'package:cartlist_admin/screens/addproduct/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryList extends StatefulWidget {
  final String categoryName;
  const SubCategoryList({super.key, required this.categoryName});

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
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
                          builder: ((context) => AddProduct(
                                categoryID: modalResponse.categoryName,
                                categoryName: widget.categoryName,
                                subCategoryId: modalResponse.subcategoryId,
                                subCategoryName: modalResponse.subcategoryName,
                              )),
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
