
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartpharma/page/login_page.dart';
import 'package:smartpharma/screen/addcustomer.dart';
import 'package:smartpharma/screen/addinvoice.dart';
import 'package:smartpharma/screen/addmedicine.dart';
import 'package:smartpharma/screen/addpurchase.dart';
import 'package:smartpharma/screen/addsupplier.dart';
import 'package:smartpharma/screen/invoices.dart';
import 'package:smartpharma/screen/dashboard.dart';
import 'package:smartpharma/screen/customers.dart';
import 'package:smartpharma/screen/my_drawer_header.dart';
import 'package:smartpharma/screen/medicines.dart';
import 'package:smartpharma/screen/purchases.dart';
import 'package:smartpharma/screen/report.dart';
import 'package:smartpharma/screen/search.dart';
import 'package:smartpharma/screen/suppliers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.invoices) {
      container =InvoicePage();
    }
    else if (currentPage == DrawerSections.addinvoice) {
      container =AddinvoicePage();
    }
    else if (currentPage == DrawerSections.customers) {
      container = CustomerPage();
    }
    else if (currentPage == DrawerSections.addcustomer) {
      container = AddcustomerPage();
    }else if (currentPage == DrawerSections.medecines) {
      container = MedecinePage();
    }
    else if (currentPage == DrawerSections.addmedicine) {
      container = AddmedicinePage();
    }else if (currentPage == DrawerSections.suppliers) {
      container = SupplierPage();
    }
    else if (currentPage == DrawerSections.addsupplier) {
      container = AddsupplierPage();
    }else if (currentPage == DrawerSections.purchases) {
      container = PurchasePage();
    } else if (currentPage == DrawerSections.addpurchase) {
      container = AddpurchasePage();
    } else if (currentPage == DrawerSections.logout) {
      container =  SearchPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("SmartPharma"),

      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Invoices", Icons.business,
              currentPage == DrawerSections.invoices ? true : false),
          menuItem(3, "AddInvoice", Icons.business,
              currentPage == DrawerSections.invoices ? true : false),
          menuItem(4, "Customers", Icons.people,
              currentPage == DrawerSections.customers ? true : false),
          menuItem(5, "Add Customer", Icons.people,
              currentPage == DrawerSections.customers ? true : false),
          menuItem(6, "Medecines", Icons.medical_services,
              currentPage == DrawerSections.medecines ? true : false),
          menuItem(7, "Add Medecine", Icons.medical_services,
              currentPage == DrawerSections.medecines ? true : false),
          Divider(),
          menuItem(8, "Suppliers", Icons.people,
              currentPage == DrawerSections.suppliers ? true : false),
          menuItem(9, "Add Supplier", Icons.people,
              currentPage == DrawerSections.addsupplier ? true : false),
          menuItem(10, "Purchases", Icons.shopping_cart,
              currentPage == DrawerSections.purchases ? true : false),
          Divider(),
          menuItem(11, "AddPurchase", Icons.shopping_cart,
              currentPage == DrawerSections.addpurchase ? true : false),
          // menuItem(12, "Logout", Icons.feedback_outlined,
          //     currentPage == DrawerSections.logout ? true : false),
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage()));

              },
            ),
          ),

        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.invoices;
            }else if (id == 3) {
              currentPage = DrawerSections.addinvoice;
            }
            else if (id == 4) {
              currentPage = DrawerSections.customers;
            }
            else if (id == 5) {
              currentPage = DrawerSections.addcustomer;
            }else if (id == 6) {
              currentPage = DrawerSections.medecines;
            }
            else if (id == 7) {
              currentPage = DrawerSections.addmedicine;
            }else if (id == 8) {
              currentPage = DrawerSections.suppliers;
            }
            else if (id == 9) {
              currentPage = DrawerSections.addsupplier;
            }else if (id == 10) {
              currentPage = DrawerSections.purchases;
            } else if (id == 11) {
              currentPage = DrawerSections.addpurchase;
            } else if (id == 12) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  invoices,
  addinvoice,
  customers,
  addcustomer,
  medecines,
  addmedicine,
  suppliers,
  addsupplier,
  purchases,
  addpurchase,
  logout,
}
