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
               "Purchases",
               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
             ),
           ),
           DataTable(
               headingRowColor: MaterialStateColor.resolveWith(
                       (states) => Colors.green),

               columns:  [

            // DataColumn(
            //   label: Text('Inv Num', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            // ),
            DataColumn(
              label: Text('Purchase date',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Supplier',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),

            DataColumn(
              label: Text('Mdecine',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
                 DataColumn(
                   label: Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                 ),
                 DataColumn(
                   label: Text('Rate',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                 ),
                 DataColumn(
                   label: Text('Total Amount',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                 ),



               ], rows: [
            for (int i = 0; i < plist.length; i++)
              DataRow(cells: [
                // DataCell(Text(plist[i].pinvonum.toString())),
                DataCell(Text(plist[i].pstdate)),
                DataCell(Text(plist[i].sname)),
                DataCell(Text(plist[i].mname)),
                DataCell(Text(plist[i].quantity.toString())),
                DataCell(Text(plist[i].rate.toString())),
                DataCell(Text(plist[i].amount.toString())),


              ])
      ]),
         ],
       ),
    ],
    ),
        ),
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
