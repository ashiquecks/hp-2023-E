import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartlist_admin/screens/updateproduct/updateCategory.dart';
import 'package:cartlist_admin/service/updateservice/updateProductService.dart';
import 'package:cartlist_admin/widget/alerDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateProduct extends StatefulWidget {
  final String productID;
  final String productName;
  final String productImage;
  final String productBrand;
  final String categoryName;
  final String subCategoryName;
  final String quantityCategory;
  final String amzone;
  final String flipkart;
  const UpdateProduct({
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
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController imgControll = TextEditingController();

  TextEditingController nameControll = TextEditingController();
  TextEditingController brandControll = TextEditingController();
  TextEditingController amzonControll = TextEditingController();
  TextEditingController flikrtControll = TextEditingController();

  TextEditingController productIDControll = TextEditingController();
  TextEditingController categoryControll = TextEditingController();
  TextEditingController subCategoryControll = TextEditingController();
  TextEditingController quantityCategoryControll = TextEditingController();

  changeTextControll() {
    setState(() {
      nameControll.text = widget.productName;
      brandControll.text = widget.productBrand;
      amzonControll.text = widget.amzone;
      flikrtControll.text = widget.flipkart;
      imgControll.text = widget.productImage;

      productIDControll.text = widget.productID;
      categoryControll.text = widget.categoryName;
      subCategoryControll.text = widget.subCategoryName;
      quantityCategoryControll.text = widget.quantityCategory;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeTextControll();
  }

  String quantityCategory = "KG";
  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        margin: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 50),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: widgetSize.width / 5,
                  height: 250,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: widget.productImage,
                    placeholder: (context, url) =>
                        Image.asset('assets/images/placeholder.jpg'),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: widgetSize.width / 1.6,
                      child: Row(
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
                                    quantityCategoryControll.text = value;
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
                                    quantityCategoryControll.text = value;
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
                                    quantityCategoryControll.text = value;
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
                                    quantityCategoryControll.text = value;
                                  });
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: widgetSize.width / 1.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: categoryControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixText: "Category ID: ",
                                  hintText: widget.categoryName),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: subCategoryControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixText: "SubCategory ID: ",
                                  hintText: widget.subCategoryName),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: productIDControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixText: "Product ID: ",
                                  hintText: widget.productID),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: quantityCategoryControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: widget.quantityCategory),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: widgetSize.width / 1.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: amzonControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: widget.amzone),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: flikrtControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: widget.flipkart),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: nameControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: widget.productName),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: brandControll,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: widget.productBrand),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: imgControll,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: widget.productImage),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "Product Description"),
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
                            child: const Text("UPDATE CATEGORY"),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateCategory(
                                    productName: nameControll.text,
                                    productBrand: brandControll.text,
                                    productImage: imgControll.text,
                                    quantityCategory:
                                        quantityCategoryControll.text,
                                    amzone: amzonControll.text,
                                    flipkart: flikrtControll.text,
                                    productID: productIDControll.text,
                                    categoryName: categoryControll.text,
                                    subCategoryName: subCategoryControll.text,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: widgetSize.width / 2.8,
                          child: ElevatedButton(
                            child: const Text("UPDATE PRODUCT"),
                            onPressed: () async {
                              var response = await updateProductService(
                                productName: nameControll.text,
                                productBrand: brandControll.text,
                                productImage: imgControll.text,
                                quantityCategory: quantityCategoryControll.text,
                                amzone: amzonControll.text,
                                flipkart: flikrtControll.text,
                                productID: productIDControll.text,
                                productCategory: categoryControll.text,
                                subCategory: subCategoryControll.text,
                                context: context,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
