
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartpharma/screen/invoice.dart';
import 'package:smartpharma/screen/dashboard.dart';
import 'package:smartpharma/screen/customer.dart';
import 'package:smartpharma/screen/my_drawer_header.dart';
import 'package:smartpharma/screen/medecine.dart';
import 'package:smartpharma/screen/purchase.dart';
import 'package:smartpharma/screen/report.dart';
import 'package:smartpharma/screen/search.dart';
import 'package:smartpharma/screen/supplier.dart';

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
    } else if (currentPage == DrawerSections.invoice) {
      container =InvoicePage();
    } else if (currentPage == DrawerSections.customer) {
      container = CustomerPage();
    } else if (currentPage == DrawerSections.medecine) {
      container = MedecinePage();
    } else if (currentPage == DrawerSections.supplier) {
      container = SupplierPage();
    } else if (currentPage == DrawerSections.purchase) {
      container = PurchasePage();
    } else if (currentPage == DrawerSections.report) {
      container = ReportPage();
    } else if (currentPage == DrawerSections.search) {
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
          menuItem(2, "Invoice", Icons.people_alt_outlined,
              currentPage == DrawerSections.invoice ? true : false),
          menuItem(3, "Customer", Icons.event,
              currentPage == DrawerSections.customer ? true : false),
          menuItem(4, "Medecine", Icons.notes,
              currentPage == DrawerSections.medecine ? true : false),
          Divider(),
          menuItem(5, "Supplier", Icons.settings_outlined,
              currentPage == DrawerSections.supplier ? true : false),
          menuItem(6, "Purchase", Icons.notifications_outlined,
              currentPage == DrawerSections.purchase ? true : false),
          Divider(),
          menuItem(7, "Report", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.report ? true : false),
          menuItem(8, "Search", Icons.feedback_outlined,
              currentPage == DrawerSections.search ? true : false),
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
              currentPage = DrawerSections.invoice;
            } else if (id == 3) {
              currentPage = DrawerSections.customer;
            } else if (id == 4) {
              currentPage = DrawerSections.medecine;
            } else if (id == 5) {
              currentPage = DrawerSections.supplier;
            } else if (id == 6) {
              currentPage = DrawerSections.purchase;
            } else if (id == 7) {
              currentPage = DrawerSections.report;
            } else if (id == 8) {
              currentPage = DrawerSections.search;
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
  invoice,
  customer,
  medecine,
  supplier,
  purchase,
  report,
  search,
}
