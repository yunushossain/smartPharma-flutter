
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartpharma/helper/http_helper.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);





  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("Todays Report " ),
            color: Colors.teal[100],

          ),

          Container(
            padding: const EdgeInsets.all(8),
            child:  Text("Total Customer " +  totalCustomer.toString()),
            color: Colors.teal[200],
          ),
          Container(

            padding: const EdgeInsets.all(8),
            child: Text("Total Supplier " +  totalSupplier.toString()),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Total MedeCine'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Out of stock', textAlign: TextAlign.center,),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Expried'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child:  Text('Total Invoice',textAlign: TextAlign.center,),



            color: Colors.teal[600],
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }

  final _http = new HttpHelper();
  var totalCustomer;
  var totalSupplier;

  @override
  void initState() {
    getTotalCustomer();
    getTotalSupplier();
  }

  Future<void> getTotalCustomer() async {

    final res =
        await _http.getData("http://192.168.1.51:8082/customer/getTotalCustomer");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      print(map['Data']);
      print("Today Customer console printed");
      setState(() {
        totalCustomer = map['Data'];
      });
    }
  }

  Future<void> getTotalSupplier() async {

    final res =
    await _http.getData("http://192.168.1.51:8082/supplier/getTotalSupplier");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      print(map['Data']);
      print("Today Supplier console printed");
      setState(() {
        totalSupplier = map['Data'];
      });
    }
  }
}