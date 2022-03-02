import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';

import 'package:smartpharma/page/model/Purchase.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {

  final _http = new HttpHelper();
  List<Purchase> plist = [];

  @override
  void initState() {
    getPurchaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: DataTable(columns: const [

        DataColumn(
          label: Text('Inv Num'),
        ),
        DataColumn(
          label: Text('Purchase date'),
        ),
        DataColumn(
          label: Text('Supplier'),
        ),

        DataColumn(
          label: Text('Mdecine'),
        ),
        DataColumn(
          label: Text('Quantity'),
        ),
        DataColumn(
          label: Text('Rate'),
        ),
        DataColumn(
          label: Text('Total amount'),
        ),


      ], rows: [
        for (int i = 0; i < 2; i++)
          DataRow(cells: [
            DataCell(Text(plist[i].pinvonum.toString())),
            DataCell(Text(plist[i].pstdate)),
            DataCell(Text(plist[i].sname)),
            DataCell(Text(plist[i].mname)),
            DataCell(Text(plist[i].quantity.toString())),
            DataCell(Text(plist[i].rate.toString())),
            DataCell(Text(plist[i].gtotal.toString())),

          ])
      ]),
    );
  }


  Future<void> getPurchaseData() async {
    final res =
    await _http.getData("http://192.168.0.106:8082/purchase/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Purchase list console printed");
      setState(() {
        plist = data.map((e) => Purchase.fromMap(e)).toList();

      });
    }
  }
}
