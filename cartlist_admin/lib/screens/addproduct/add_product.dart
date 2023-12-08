import 'package:cartlist_admin/service/postservice/addProduct.dart';
import 'package:cartlist_admin/service/postservice/addSponsorProduct.dart';
import 'package:cartlist_admin/widget/alerDialog.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  final String categoryName;
  final String categoryID;
  final String subCategoryName;
  final String subCategoryId;
  const AddProduct({
    super.key,
    required this.categoryName,
    required this.categoryID,
    required this.subCategoryName,
    required this.subCategoryId,
  });

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController imgControll = TextEditingController();
  TextEditingController nameControll = TextEditingController();
  TextEditingController brandControll = TextEditingController();

  String quantityCategory = "KG";

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          IconButton(
              onPressed: () {
                imgControll.clear();
                nameControll.clear();
                brandControll.clear();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Card(
        margin:
            const EdgeInsets.only(left: 100, right: 100, top: 50, bottom: 50),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: widget.categoryName),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: widget.subCategoryName),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: imgControll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Product Image Link"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameControll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Product Name"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: brandControll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Product Barand"),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: RadioListTile(
                          title: const Text("KG"),
                          value: "KG",
                          groupValue: quantityCategory,
                          onChanged: ((value) {
                            setState(() {
                              quantityCategory = value!;
                            });
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: RadioListTile(
                          title: const Text("LITER"),
                          value: "LITER",
                          groupValue: quantityCategory,
                          onChanged: ((value) {
                            setState(() {
                              quantityCategory = value!;
                            });
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: RadioListTile(
                          title: const Text("PAK"),
                          value: "PAK",
                          groupValue: quantityCategory,
                          onChanged: ((value) {
                            setState(() {
                              quantityCategory = value!;
                            });
                          }),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: RadioListTile(
                          title: const Text("ITEM"),
                          value: "ITEM",
                          groupValue: quantityCategory,
                          onChanged: ((value) {
                            setState(() {
                              quantityCategory = value!;
                            });
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: widgetSize.width / 2.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("ADD SPONSOR LIST"),
                        onPressed: () async {
                          var response =
                              await SponsorProductservice.AddSponsorProduct(
                            productName: nameControll.text,
                            productBrand: brandControll.text,
                            productImage: imgControll.text,
                            productCategory: widget.categoryID,
                            subCategory: widget.subCategoryId,
                            quantityCategory: quantityCategory,
                            amzone: 'http',
                            flipkart: 'http',
                          );
                          if (response.isSuccessful!) {
                            showAlertDialogOne(
                                message: response.data!.message,
                                context: context);
                          } else {
                            showAlertDialogOne(
                                message: response.message!, context: context);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: widgetSize.width / 2.8,
                      child: ElevatedButton(
                        child: const Text("ADD PRODUCT LIST"),
                        onPressed: () async {
                          var response = await Productservice.AddProduct(
                            productName: nameControll.text,
                            productBrand: brandControll.text,
                            productImage: imgControll.text,
                            productCategory: widget.categoryID,
                            subCategory: widget.subCategoryId,
                            quantityCategory: quantityCategory,
                            amzone: 'http',
                            flipkart: 'http',
                          );
                          if (response.isSuccessful!) {
                            showAlertDialogOne(
                                message: response.data!.message,
                                context: context);
                          } else {
                            showAlertDialogOne(
                                message: response.message!, context: context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
