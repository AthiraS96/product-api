import 'package:flutter/material.dart';

class details extends StatelessWidget {
  final Map<String, dynamic> products;

  details({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            products['image'],
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            products['title'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            products['price'].toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            products['description'],
            style: TextStyle(fontSize: 18),
          ),
          // Text(_category[index]['description']),
        ],
      ),
    ));
  }
}
