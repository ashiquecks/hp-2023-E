import 'package:cartlist_admin/functions/api_callfunction.dart';
import 'package:cartlist_admin/models/RecentFile.dart';
import 'package:cartlist_admin/screens/addcategory/addcategory.dart';
import 'package:cartlist_admin/screens/addproduct/add_product.dart';
import 'package:cartlist_admin/screens/addsubcategory/addsub_category.dart';
import 'package:cartlist_admin/screens/categorylist/category_list.dart';
import 'package:cartlist_admin/screens/categorylist/subcategory_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create Credentials",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const AddCategory()),
                      ),
                    );
                  },
                  leading: const Icon(Icons.grid_view),
                  title: const Text("Create New Category"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CategoryList(
                              pageName: 'subCategory',
                            )),
                      ),
                    );
                  },
                  leading: const Icon(Icons.grid_view),
                  title: const Text("Create New Subcategory"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CategoryList(
                              pageName: 'product',
                            )),
                      ),
                    );
                  },
                  leading: const Icon(Icons.grid_view),
                  title: const Text("Create New Product"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
