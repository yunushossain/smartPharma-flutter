import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/AddCustomer.dart';

class AddcustomerPage extends StatefulWidget {
  @override
  _AddcustomerPageState createState() => _AddcustomerPageState();
}

class _AddcustomerPageState extends State<AddcustomerPage> {
  final _http = HttpHelper();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _doctorAddressController = TextEditingController();

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
                  'Add new Customer',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer Name',
                    hintText: "Type your Fullname"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Customer Email',
                    hintText: "Type your Email ID"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Customer Contact',
                    hintText: "Type your Phone number"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Customer Address',
                    hintText: "Type your Address"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _doctorNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Doctor Name',
                    hintText: "Type your Address"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _doctorAddressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Doctor Address',
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
                      primary: Colors.green
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
                    print(_doctorNameController.text);
                    print(_doctorAddressController.text);
                    addCustomer();
                  },
                )),
          ],
        ));
  }

  Future<void> addCustomer() async {
    String cname = _nameController.value.text;
    String cemail = _emailController.value.text;
    String ccontact = _mobileController.value.text;
    String caddress = _addressController.value.text;
    String cdname = _doctorNameController.value.text;
    String cdaddress = _doctorAddressController.value.text;

    var model = AddCustomer(
        cname: cname,
        cemail: cemail,
        ccontact: ccontact,
        caddress: caddress,
        cdname: cdname,
        cdaddress: cdaddress);
    String _body = jsonEncode(model.toMap());

    try {
      final response =
          await _http.postData('http://192.168.0.106:8082/customer/save', _body);

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
      _doctorNameController.clear();
      _doctorAddressController.clear();
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
