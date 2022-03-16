// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smartpharma/page/login_page.dart';
// import 'package:smartpharma/screen/dashboard.dart';
//
// class Bottom_bar extends StatefulWidget {
//   @override
//   State createState() {
//     return _MyApp();
//   }
// }
//
// class _MyApp extends State {
//   Widget? _child;
//
//   @override
//   void initState() {
//     _child = DashboardPage();
//     super.initState();
//   }
//
//   @override
//   Widget build(context) {
//     // Build a simple container that switches content based of off the selected navigation item
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//
//         //backgroundColor: Color(0xFF920152),
//         extendBody: true,
//         body: _child,
//         bottomNavigationBar: FluidNavBar(
//           icons: [
//             FluidNavBarIcon(
//                 icon: Icons.menu,
//                 extras: {"label": "Category"}),
//             FluidNavBarIcon(
//                 icon: Icons.home,
//                 extras: {"label": "DashboardPage"}),
//             FluidNavBarIcon(
//                 icon: Icons.person,
//                 extras: {"label": "Profile"}),
//           ],
//          // onChange: _handleNavigationChange,
//           style: FluidNavBarStyle(
//               barBackgroundColor: Colors.green,
//               iconSelectedForegroundColor: Colors.white,
//               iconUnselectedForegroundColor: Colors.white70),
//           scaleFactor: 1.5,
//           defaultIndex: 1,
//           itemBuilder: (icon, item) =>
//               Semantics(
//                 label: icon.extras!["label"],
//                 child: item,
//               ),
//         ),
//       ),
//     );
//   }
// }