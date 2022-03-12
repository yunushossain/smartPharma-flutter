import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';

import 'package:smartpharma/page/model/ShowInvoice.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {

  final _http = new HttpHelper();
  List<ShowInvoice> invlist = [];

  @override
  void initState() {
    getInvoiceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DataTable(columns: const [

              DataColumn(
                label: Text('Invo Num'),
              ),
              DataColumn(
                label: Text('Customer Name'),
              ),
              DataColumn(
                label: Text('Date'),
              ),

              DataColumn(
                label: Text('Total Amount'),
              ),
              DataColumn(
                label: Text('Total Discount'),
              ),
              DataColumn(
                label: Text(' Net Total '),
              ),


            ], rows: [
              for (int i = 0; i <invlist.length; i++)
                DataRow(cells: [
                  DataCell(Text(invlist[i].id.toString())),
                  DataCell(Text(invlist[i].customerName)),
                  DataCell(Text(invlist[i].date)),
                  DataCell(Text(invlist[i].totalAmount.toString())),
                  DataCell(Text(invlist[i].totalDiscount.toString())),
                  DataCell(Text(invlist[i].netTotal.toString())),


                ])
            ]),
          ],
        ),
      ),
    );
  }


  Future<void> getInvoiceData() async {
    final res =
    await _http.getData("http://192.168.1.51:8082/showinvoice/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("showinvoice list console printed");
      setState(() {
        invlist = data.map((e) => ShowInvoice.fromMap(e)).toList();

      });
    }
  }
}
