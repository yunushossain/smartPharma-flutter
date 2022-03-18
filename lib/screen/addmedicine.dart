import 'package:flutter/material.dart';

class AddmedicinePage extends StatefulWidget {
  @override
  _AddmedicinePageState createState() => _AddmedicinePageState();
}

class _AddmedicinePageState extends State<AddmedicinePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  // final _coursesController = TextEditingController();


  var courseTypes = ["Gave","Jee","WPS"];
  var selectedCourseType;

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
                  'Add new Medicine',
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
                    labelText: 'Medicine Name',
                    hintText: "Type Medicine Name"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Generic name',
                    hintText: "Type your Email ID"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Paking',
                    hintText: "Type your Phone number"),
              ),
            ),


            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Supplier Name',
                    hintText: "Type your Address"),
                items: courseTypes.map((String coursetype){
                  return DropdownMenuItem(
                    value: coursetype,
                    child: Text(coursetype),
                  );
                }).toList(),
                onChanged: (newValue){
                  setState(() => selectedCourseType = newValue);
                },
                value: selectedCourseType,
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
                    print(selectedCourseType);

                  },
                )),
          ],
        ));
  }
}