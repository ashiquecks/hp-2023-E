import 'dart:async';
import 'package:cartlist_admin/models/searchProductModal.dart';
import 'package:cartlist_admin/screens/updateproduct/updateProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final _debouncer = Debouncer();

  List<SearchAllProduct> allProduct = [];
  List<SearchAllProduct> searchProduct = [];

  String url =
      'http://18.183.210.225/cartlistapp_api/cartlist/get_data/search_product.php';

  Future<List<SearchAllProduct>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<SearchAllProduct> list = searchAllProductFromJson(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        allProduct = subjectFromServer;
        searchProduct = allProduct;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    searchProduct = allProduct
                        .where(
                          (u) => (u.productName.toUpperCase().contains(
                                string.toUpperCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(5),
              itemCount: searchProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 80,
                  child: Card(
                    color: searchProduct[index].productName == "noname"
                        ? Colors.transparent
                        : Colors.blueGrey,
                    elevation:
                        searchProduct[index].productName == "noname" ? 0 : 4,
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          width: 70,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: searchProduct[index].productName == "noname"
                              ? const SizedBox()
                              : Image.network(
                                  searchProduct[index].productImage),
                        ),
                        title: Text(searchProduct[index].productName == "noname"
                            ? ""
                            : searchProduct[index].productName),
                        trailing: searchProduct[index].productName == "noname"
                            ? const SizedBox()
                            : ElevatedButton(
                                child: const Text("Edite Product"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateProduct(
                                        categoryName: searchProduct[index]
                                            .productCategory,
                                        subCategoryName:
                                            searchProduct[index].subCategory,
                                        amzone: searchProduct[index].amzone,
                                        flipkart: searchProduct[index].flipkart,
                                        productBrand:
                                            searchProduct[index].productBrand,
                                        productID:
                                            searchProduct[index].productId,
                                        productImage:
                                            searchProduct[index].productImage,
                                        productName:
                                            searchProduct[index].productName,
                                        quantityCategory: searchProduct[index]
                                            .quantityCategory,
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
        ],
      ),
    );
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
