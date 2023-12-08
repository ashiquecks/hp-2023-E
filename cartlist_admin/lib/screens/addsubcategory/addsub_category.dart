import 'package:cartlist_admin/service/postservice/addSubCategory.dart';
import 'package:cartlist_admin/widget/alerDialog.dart';
import 'package:flutter/material.dart';

class AddSubCategory extends StatefulWidget {
  final String subCategoryName;
  final String subCategoryId;
  const AddSubCategory(
      {super.key, required this.subCategoryName, required this.subCategoryId});

  @override
  State<AddSubCategory> createState() => _AddSubCategoryState();
}

class _AddSubCategoryState extends State<AddSubCategory> {
  TextEditingController subName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Sub Category"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              widget.subCategoryId,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
      body: Card(
        margin: const EdgeInsets.all(100),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: widget.subCategoryName),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: subName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Sub Category Name"),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: widgetSize.width,
                child: ElevatedButton(
                  child: const Text("ADD SUB CATEGORY"),
                  onPressed: () async {
                    var response = await SubCategoryservice.addSubCategory(
                        categoryID: widget.subCategoryId,
                        subCategoryName: subName.text);
                    if (response.isSuccessful!) {
                      showAlertDialogOne(
                          message: response.data!.message, context: context);
                    } else {
                      showAlertDialogOne(
                          message: response.message!, context: context);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
