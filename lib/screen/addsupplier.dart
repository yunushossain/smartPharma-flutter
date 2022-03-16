import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/AddSupplier.dart';

class AddsupplierPage extends StatefulWidget {
  @override
  _AddsupplierPageState createState() => _AddsupplierPageState();
}

class _AddsupplierPageState extends State<AddsupplierPage> {
  final _http = HttpHelper();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();

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
                  'Add new Supplier',
                  style: TextStyle(
                      color: Color.fromRGBO(49, 87, 110, 1.0),
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Supplier Name',
                    hintText: "Type your Fullname"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Supplier Email',
                    hintText: "Type your Email ID"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Supplier Contact',
                    hintText: "Type your Phone number"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Supplier Address',
                    hintText: "Type your Address"),
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
                      primary: Color.fromRGBO(49, 87, 110, 1.0)
                  ),
                  child: const Text(
                    'Add',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {
                    print(_nameController.text);
                    print(_emailController.text);
                    print(_mobileController.text);
                    print(_addressController.text);
                    addSupplier();


                  },
                )),
          ],
        ));
  }

  Future<void> addSupplier() async {
    String sname = _nameController.value.text;
    String semail = _emailController.value.text;
    String scontact = _mobileController.value.text;
    String saddress = _addressController.value.text;


    var model = AddSupplier(
        sname: sname,
        semail: semail,
        scontact: scontact,
        saddress: saddress);

    String _body = jsonEncode(model.toMap());

    try {
      final response =
      await _http.postData('http://192.168.1.51:8082/supplier/save', _body);

      Fluttertoast.showToast(
          msg: "New Customer added Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          fontSize: 20,
          backgroundColor: Colors.green);
      _nameController.clear();
      _emailController.clear();
      _mobileController.clear();
      _addressController.clear();


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


}
