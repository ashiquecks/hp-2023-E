import 'package:cartlist_admin/service/getservice/getCategory.dart';
import 'package:cartlist_admin/service/postservice/addCategory.dart';
import 'package:cartlist_admin/widget/alerDialog.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController categoryName = TextEditingController();
  TextEditingController categoryImage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: Card(
        margin: const EdgeInsets.all(100),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: categoryImage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Category Image Link"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: categoryName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Category Name"),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: widgetSize.width,
                child: ElevatedButton(
                  child: const Text("ADD CATEGORY"),
                  onPressed: () async {
                    var response = await AddCategoryservice.addCategory(
                        categoryImage: categoryImage.text,
                        categoryName: categoryName.text);
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
