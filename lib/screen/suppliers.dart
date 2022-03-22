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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
       Column(
         children: [
           Padding(
             padding: EdgeInsets.all(20),
             child: Text(
               "Suppliers",
               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
             ),
           ),
           DataTable(

               headingRowColor: MaterialStateColor.resolveWith(
                       (states) => Colors.green),
               columns:  [
            DataColumn(
              label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),

            DataColumn(
              label: Text('Contact', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),


      ], rows: [
            for (int i = 0; i < slist.length; i++)
              DataRow(cells: [
                DataCell(Text(slist[i].sid.toString())),
                DataCell(Text(slist[i].sname)),
                DataCell(Text(slist[i].semail)),
                DataCell(Text(slist[i].scontact)),


              ])
      ]),
         ],
       ),
    ],
    ),
        ),

    );
  }

  Future<void>  getSupplierData() async {
    final res =
    await _http.getData("http://192.168.0.106:8082/supplier/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Supplier list console printed");
      setState(() {
        slist = data.map((e) => Supplier.fromMap(e)).toList();

      });
    }
  }


}
