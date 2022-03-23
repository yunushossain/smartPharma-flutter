
import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpharma/helper/http_helper.dart';

import 'package:smartpharma/page/model/AddPurchase.dart';
import 'package:smartpharma/page/model/Customer.dart';
import 'package:smartpharma/page/model/Purchase.dart';
import 'package:smartpharma/page/model/Supplier.dart';

class AddinvoicePage  extends StatefulWidget {

  late final sname;
  late final mname;
  late final cname;

  AddinvoicePage({
    this.sname


  });


  @override
  _AddinvoicePageState createState() => _AddinvoicePageState();
}

class _AddinvoicePageState extends State<AddinvoicePage> {
  List<Supplier> slist = [];
  List<Purchase> plist = [];
  List<Customer> clist = [];


  final _http = HttpHelper();
  final _pdateController = TextEditingController();
  final _quantityController = TextEditingController();
  final _rateController = TextEditingController();
  final _amountController = TextEditingController();
  final _cnameController = TextEditingController();
  final _mnameController = TextEditingController();
  Customer cs=new Customer(cid: (0), cname: "", cemail: "", ccontact: "", caddress: "", cdname: "", cdaddress: "");
  Purchase ps =new Purchase(pid: (0), sname: "", pinvonum: (0), ppaytype: "", pstdate: "", mname: "", mpaking: "", batchid: "", expdate: "", quantity: (0), mrp: (0), rate: (0), amount: (0), gtotal: (0));



  // final _coursesController = TextEditingController();

  var courseTypes = ["Gave","Jee","WPS"];
  var selectedCourseType;
  late String supplier;
  late String purchase;
  late String customer;

  @override
  void initState(){
    supplier = "";
    purchase = "";
    customer = "";

    getPurchaseData();
    getCustomerData();

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(

          children: <Widget>[

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: const Text(
                  'Add new Invoice',
                  style: TextStyle(
                      color: Color.fromRGBO(49, 87, 110, 1.0),
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                )),
            Container(
              padding: EdgeInsets.only(left: 16, top: 25),
              child: DropDownFormField(

                hintText: 'Select Customer',
                titleText: 'Customer Name',
                value: customer,
                // onSaved: (value) {
                //   setState(() {
                //     _myActivity = value;
                //     print(_myActivity);
                //   });
                // },
                onChanged: (value) {
                  setState(() {
                    print(customer);
                    customer = value;
                  });
                },

                dataSource: [
                  for(var i = 0; i< clist.length; i++){


                    "display": clist[i].cname,
                    "value": clist[i].cname,

                  },



                ],
                textField: "display",
                valueField:"value",

              ),


            ),

            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                controller: _pdateController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sell  Date',
                    hintText: "Type Sell date"),
              ),
            ),


            Container(
              padding: EdgeInsets.only(left: 16, top: 25),
              child: DropDownFormField(
                titleText: 'Medicine Name',
                hintText: 'Select Medicine',
                value: purchase,
                // onSaved: (value) {
                //   setState(() {
                //     _myActivity = value;
                //     print(_myActivity);
                //   });
                // },
                onChanged: (value) {
                  setState(() {
                    print(purchase);
                    purchase = value;
                  });
                },

                dataSource: [
                  for(var i = 0; i< plist.length; i++){


                    "display": plist[i].mname,
                    "value": plist[i].mname,

                  },



                ],
                textField: "display",
                valueField:"value",

              ),


            ),


            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _quantityController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Quantity',
                    hintText: "Type Quantity"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _rateController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Rate',
                    hintText: "Type Rate"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Total Amount',
                    hintText: " "),
              ),
            ),




            const SizedBox(
              height: 30.0,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green
                  ),
                  child: const Text(
                    'Add',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {

                    print(_cnameController.text);
                    print(_pdateController.text);
                    print(_mnameController.text);
                    print(_quantityController.text);
                    print(_rateController.text);
                    print(_amountController.text);

                    print(customer);
                    print(purchase);
                    addPurchase();

                  },
                )),
          ],
        ));
  }

  Future<void> addPurchase() async {

    String pstdate =_pdateController.value.text;
    int quantity = int.parse(_quantityController.value.text);
    double rate =double.parse(_quantityController.value.text);
    double amount = double.parse(_quantityController.value.text);
    String sname = supplier;
    String mname = purchase;


    var model =  AddPurchase(
        mname: mname,
        pstdate: pstdate,
        quantity: quantity,
        rate: rate,
        amount: amount,
        sname: sname);

    String _body = jsonEncode(model.toMap());

    try {
      final response =
      await _http.postData('http://192.168.0.106:8082/purchase/save', _body);
      if(response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "New Medecine added Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            fontSize: 20,
            backgroundColor: Colors.green);
        _mnameController.clear();
        _quantityController.clear();
        _rateController.clear();
        _cnameController.clear();
        _pdateController.clear();
        _amountController.clear();
      }

    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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

