import 'dart:convert';

import 'package:exam_get_api/detail.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<dynamic> _category = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _category = data;
      });
    } else {
      // Handle error
      print('Failed to fetch categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Gadget shops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _category.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            details(products: _category[index])));
              },
              child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              _category[index]['id'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text('.'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              _category[index]['category'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.network(
                          _category[index]['image'],
                          scale: 15,
                        ),
                        Text(
                          _category[index]['title'],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        Text(
                          _category[index]['price'].toString(),
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),

                    // child: Row(
                    //   children: [
                    //     Image.network(
                    //       _category[index]['strCategoryThumb'],
                    //       scale: 2,
                    //     ),
                    //     SizedBox(
                    //       width: 40,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(_category[index]['idCategory']),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         Text(
                    //           _category[index]['strCategory'],
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold, fontSize: 20),
                    //         ),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         //Text(_category[index]['price'].toString()),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
