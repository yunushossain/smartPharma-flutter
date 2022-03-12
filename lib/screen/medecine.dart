import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/Medicine.dart';

class MedecinePage extends StatefulWidget {
  @override
  _MedecinePageState createState() => _MedecinePageState();
}

class _MedecinePageState extends State<MedecinePage> {

  final _http = new HttpHelper();
  List<Medicine> mlist = [];

  @override
  void initState() {
    getMedecineData();
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
          label: Text('ID'),
        ),
        DataColumn(
          label: Text('Medecine'),
        ),
        DataColumn(
          label: Text('Generic Name'),
        ),

        DataColumn(
          label: Text('Paking'),
        ),
        DataColumn(
          label: Text('Supplier'),
        ),

      ], rows: [
        for (int i = 0; i <mlist.length; i++)
          DataRow(cells: [
            DataCell(Text(mlist[i].mid.toString())),
            DataCell(Text(mlist[i].mname)),
            DataCell(Text(mlist[i].mgname)),
            DataCell(Text(mlist[i].mpaking)),
            DataCell(Text(mlist[i].sname)),


          ])
      ]),
    ],
    ),
    ),
    );
  }


  Future<void> getMedecineData() async {
    final res =
    await _http.getData("http://192.168.1.51:8082/medicine/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;
      print("Medecine list console printed");
      setState(() {
        mlist = data.map((e) => Medicine.fromMap(e)).toList();

      });
    }
  }
}
