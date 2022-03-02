import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/Supplier.dart';

class SupplierPage extends StatefulWidget {
  @override
  _SupplierPageState createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {

  final _http = new HttpHelper();
  List<Supplier> slist = [];

  @override
  void initState() {
    getSupplierData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(columns: const [
        DataColumn(
          label: Text('ID'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Email'),
        ),

        DataColumn(
          label: Text('Contact'),
        ),
        DataColumn(
          label: Text('Address'),
        ),

      ], rows: [
        for (int i = 0; i < 2; i++)
          DataRow(cells: [
            DataCell(Text(slist[i].sid.toString())),
            DataCell(Text(slist[i].sname)),
            DataCell(Text(slist[i].semail)),
            DataCell(Text(slist[i].scontact)),
            DataCell(Text(slist[i].saddress)),

          ])
      ]),
    );
  }

  Future<void>  getSupplierData() async {
    final res =
    await _http.getData("http://192.168.1.51:8082/supplier/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Invoice list console printed");
      setState(() {
        slist = data.map((e) => Supplier.fromMap(e)).toList();

      });
    }
  }


}
