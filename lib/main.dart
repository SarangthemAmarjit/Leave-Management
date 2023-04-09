import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/pages/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'KulimPark'),
        builder: EasyLoading.init(),
        home: const LoginPage());
  }
}
