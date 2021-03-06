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
                    "Customers",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    columns: [
                      DataColumn(
                        label: Text(
                          'ID',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Contact',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Doctor Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Doctor Address',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                    rows: [
                      for (int i = 0; i < clist.length; i++)
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getCustomerData() async {
    final res = await _http.getData("http://192.168.0.106:8082/customer/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Customer list console printed");
      setState(() {
        clist = data.map((e) => Customer.fromMap(e)).toList();
      });
    }
  }
}
