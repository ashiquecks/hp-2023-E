import 'package:cartlist_admin/service/postservice/addMainBanner.dart';
import 'package:cartlist_admin/service/postservice/addSecondBanner.dart';
import 'package:cartlist_admin/widget/alerDialog.dart';
import 'package:flutter/material.dart';

class AddBanner extends StatefulWidget {
  const AddBanner({super.key});

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  TextEditingController bannerImage = TextEditingController();
  TextEditingController bannerLink = TextEditingController();
  TextEditingController bannerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Banner"),
      ),
      body: Card(
        margin: const EdgeInsets.all(100),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: bannerImage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Banner Image Link"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: bannerLink,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Banner Link"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: bannerDescription,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Banner Description"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: widgetSize.width / 2.8,
                    child: ElevatedButton(
                      child: const Text("ADD MAINBANNER"),
                      onPressed: () async {
                        var response = await AddMainBannerservice.addMainBanner(
                          bannerImage: bannerImage.text,
                          bannerLink: bannerLink.text,
                          description: bannerDescription.text,
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
                      child: const Text("ADD SECOND BANNER"),
                      onPressed: () async {
                        var response =
                            await AddSecondBannerservice.addSecondBanner(
                          bannerImage: bannerImage.text,
                          bannerLink: bannerLink.text,
                          description: bannerDescription.text,
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
