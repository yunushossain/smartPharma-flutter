import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0,top: 8),
                    child: Row(
                      children: [
                        Icon(Icons.person_add)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "Total Customer"  ,
                            textAlign: TextAlign.center,
                             style: TextStyle(fontSize: 20),

                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0,top: 8),
                    child: Row(
                      children: [
                       Text(totalCustomer.toString(),
                         style: TextStyle(fontSize: 20),
                       )
                      ],
                    ),
                  ),



                ],
              ),






            color: Colors.teal[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.person_add)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Total Supplier"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(totalSupplier.toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.medical_services)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Total Medecine"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 12 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.business)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Total Invoice"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 5 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Total Sales"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 0 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Total Purchase"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 0 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.outbond )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Out of stock"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 0 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
          ),


          Container(
            padding: const EdgeInsets.all(8),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Icon(Icons.outbond )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Expried"  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,top: 8),
                  child: Row(
                    children: [
                      Text(" 0 ",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),



              ],
            ),






            color: Colors.teal[200],
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
            label: 'Invoice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart_rounded),
            label: 'Purchase',
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
    final res = await _http
        .getData("http://192.168.1.51:8082/customer/getTotalCustomer");
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
    final res = await _http
        .getData("http://192.168.1.51:8082/supplier/getTotalSupplier");
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
