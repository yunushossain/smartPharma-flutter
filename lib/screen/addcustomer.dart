import 'package:flutter/material.dart';

class AddcustomerPage extends StatefulWidget {
  @override
  _AddcustomerPageState createState() => _AddcustomerPageState();
}

class _AddcustomerPageState extends State<AddcustomerPage> {
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
                controller: _addressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Doctor Name',
                    hintText: "Type your Address"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _addressController,
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
                    print(_doctorNameController.text);
                    print(_doctorAddressController.text);

                  },
                )),
          ],
        ));
  }
}