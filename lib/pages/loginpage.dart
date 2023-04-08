import 'package:flutter/material.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:leavemanagementadmin/pages/sidebar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          child: Container(
            height: height / 1.8,
            width: width / 1.8,
            color: Colors.blue,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[50],
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            SizedBox(
                                height: 90,
                                child: Image.asset(
                                    "assets/images/G-png-only.png")),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Leave Management System",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Text(
                              "Admin Panel",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Form(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 120,
                              ),
                              const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                autofillHints: const [AutofillHints.email],
                                //not for form, this will make the input suggest that the field wants email as input
                                decoration: const InputDecoration(
                                    fillColor: Colors.amber,
                                    prefixIcon:
                                        Icon(Icons.account_circle_outlined),
                                    border: OutlineInputBorder(),
                                    labelText: "Email/UserName ",
                                    hintText: "example@gmail.com"),

                                cursorColor: Colors.red,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                autofillHints: const [AutofillHints.email],
                                //not for form, this will make the input suggest that the field wants email as input
                                decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.lock_outline_rounded),
                                    border: OutlineInputBorder(),
                                    labelText: "Password : ",
                                    hintText: " type your password here"),

                                cursorColor: Colors.red,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SidebarXExampleApp()),
                                  );
                                },
                                child: Center(
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: const CardWidget(
                                        gradient: [
                                          Color.fromARGB(255, 211, 32, 39),
                                          Color.fromARGB(255, 164, 92, 95)
                                        ],
                                        width: 340,
                                        height: 48,
                                        borderRadius: 2,
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )),
                        ),
                      ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
