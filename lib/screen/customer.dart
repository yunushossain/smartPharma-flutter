import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/Customer.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  final _http = new HttpHelper();
  List<Customer> clist = [];

  @override
  void initState() {
    getCustomerData();
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
         DataColumn(
           label: Text('Doctor Name'),
         ),
         DataColumn(
          label: Text('Doctor Address'),
         ),
      ], rows: [
        for (int i = 0; i < 2; i++)
          DataRow(cells: [
            DataCell(Text(clist[i].cid.toString())),
            DataCell(Text(clist[i].cname)),
             DataCell(Text(clist[i].cemail)),
             DataCell(Text(clist[i].ccontact)),
             DataCell(Text(clist[i].caddress)),
             DataCell(Text(clist[i].cdname)),
             DataCell(Text(clist[i].cdaddress)),
          ])
      ]),
    );
  }

  Future<void> getCustomerData() async {
    final res =
    await _http.getData("http://192.168.1.51:8082/customer/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Invoice list console printed");
      setState(() {
        clist = data.map((e) => Customer.fromMap(e)).toList();

      });
    }
  }
}
