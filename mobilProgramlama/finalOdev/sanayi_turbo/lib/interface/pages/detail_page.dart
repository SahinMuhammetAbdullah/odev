// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:sanayi_turbo/data/entity/products.dart';

class DetailPage extends StatefulWidget {
  Product product;
  DetailPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var tfProductName = TextEditingController();
  var tfProductPrice = TextEditingController();

  @override
  void initState() {
    super.initState();
    var product = widget.product;
    tfProductName.text = product.name;
    tfProductPrice.text = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
