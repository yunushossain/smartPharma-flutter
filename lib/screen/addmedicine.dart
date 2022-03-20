import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpharma/helper/http_helper.dart';
import 'package:smartpharma/page/model/AddMedicine.dart';
import 'package:smartpharma/page/model/Supplier.dart';

class AddmedicinePage extends StatefulWidget {

  late final sname;

  AddmedicinePage({
  this.sname
});

  @override
  _AddmedicinePageState createState() => _AddmedicinePageState();
}

class _AddmedicinePageState extends State<AddmedicinePage> {
  List<Supplier> slist = [];


  final _http = HttpHelper();
  final _mnameController = TextEditingController();
  final _mgnameController = TextEditingController();
  final _mpakingController = TextEditingController();
  final _snameController = TextEditingController();
    Supplier sp=new Supplier(sid: (0), sname: "", semail: "", scontact: "scontact", saddress: "");


  // final _coursesController = TextEditingController();

  var courseTypes = ["Gave","Jee","WPS"];
  var selectedCourseType;
  late String supplier;

  @override
  void initState(){
    supplier = "";
    getSupplierData();

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
                  'Add new Medicine',
                  style: TextStyle(
                      color: Color.fromRGBO(49, 87, 110, 1.0),
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                controller: _mnameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Medicine Name',
                    hintText: "Type Medicine Name"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _mgnameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Generic name',
                    hintText: "Type your Email ID"),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: _mpakingController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Paking',
                    hintText: "Type your Phone number"),
              ),
            ),


          Container(
            padding: EdgeInsets.only(left: 16, top: 25),
            child: DropDownFormField(

              hintText: 'Select supplier',
              value: supplier,
              // onSaved: (value) {
              //   setState(() {
              //     _myActivity = value;
              //     print(_myActivity);
              //   });
              // },
              onChanged: (value) {
                setState(() {
                  print(supplier);
                  supplier = value;
                });
              },

              dataSource: [
                for(var i = 0; i< slist.length; i++){
                 sp = slist[i]
                },

                {
                  "display": sp.sname,
                  "value": sp.sname,
                },

              ],
              textField: "display",
              valueField:"value",

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


                    print(_mgnameController.text);
                    print(_mgnameController.text);
                    print(_mpakingController.text);
                    //print(selectedCourseType);
                    print(supplier);
                    addMedicine();

                  },
                )),
          ],
        ));
  }

  Future<void> addMedicine() async {
    String mname = _mnameController.value.text;
    String mgname = _mgnameController.value.text;
    String mpaking = _mpakingController.value.text;
   String sname = supplier;


    var model =  AddMedicine(
        mname: mname,
        mgname: mgname,
        mpaking: mpaking,
        sname: sname);

    String _body = jsonEncode(model.toMap());

    try {
      final response =
      await _http.postData('http://192.168.1.51:8082/medicine/save', _body);
        if(response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: "New Medecine added Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              fontSize: 20,
              backgroundColor: Colors.green);
          _mnameController.clear();
          _mgnameController.clear();
          _mpakingController.clear();
          _snameController.clear();
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


  Future<void>  getSupplierData() async {
    final res =
    await _http.getData("http://192.168.1.51:8082/supplier/getAll");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['Data'] as List<dynamic>;

      setState(() {
        slist = data.map((e) => Supplier.fromMap(e)).toList();

        print(slist);
      });
    }
  }

}

