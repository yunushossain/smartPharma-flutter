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
       Column(
         children: [
           Padding(
             padding: EdgeInsets.all(20),
             child: Text(
               "Medicines",
               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
             ),
           ),
           DataTable(
               headingRowColor: MaterialStateColor.resolveWith(
                       (states) => Colors.green),

               columns:  [

            DataColumn(
              label: Text('ID',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Medecine',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Generic Name',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),

            DataColumn(
              label: Text('Paking',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            DataColumn(
              label: Text('Supplier',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
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
