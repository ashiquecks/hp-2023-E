import 'package:cartlist_admin/constants.dart';
import 'package:cartlist_admin/screens/addbanner/addBanner.dart';
import 'package:flutter/material.dart';

class SponsordSection extends StatelessWidget {
  const SponsordSection({
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
            "Sponsor section",
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
                        builder: ((context) => const AddBanner()),
                      ),
                    );
                  },
                  leading: const Icon(Icons.grid_view),
                  title: const Text("Create New Main Banner"),
                ),
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: ((context) => const CategoryList(
                    //           pageName: 'subCategory',
                    //         )),
                    //   ),
                    // );
                  },
                  leading: const Icon(Icons.grid_view),
                  title: const Text("Create New Second Banner"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
