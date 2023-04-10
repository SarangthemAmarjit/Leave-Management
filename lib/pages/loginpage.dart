import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/constant.dart';

@RoutePage()
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
          color: Colors.grey[100],
          elevation: 20,
          child: SizedBox(
            height: height / 1.8,
            width: width / 1.8,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[100],
                      height: height / 3.8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: SizedBox(
                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 90,
                                  child: Image.asset(
                                      "assets/images/G-png-only.png")),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Leave Management System",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
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
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Center(
                          child: SizedBox(
                            // color: Colors.amber,
                            height: height / 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: height / 32,
                                ),
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  autofillHints: const [AutofillHints.email],
                                  //not for form, this will make the input suggest that the field wants email as input
                                  decoration: const InputDecoration(
                                      // fillColor: Colors.amber,
                                      prefixIcon:
                                          Icon(Icons.account_circle_outlined),
                                      border: OutlineInputBorder(),
                                      labelText:
                                          "re-enter your email/ phone no. :",
                                      hintText: "example@globizs.com"),

                                  cursorColor: Colors.red,
                                ),
                                SizedBox(
                                  height: height / 48,
                                ),
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  autofillHints: const [AutofillHints.email],
                                  //not for form, this will make the input suggest that the field wants email as input
                                  decoration: const InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.lock_outline_rounded),
                                      border: OutlineInputBorder(),
                                      labelText: "OTP : ",
                                      hintText:
                                          " enter the one time password received"),

                                  cursorColor: Colors.red,
                                ),
                                SizedBox(
                                  height: height / 46,
                                ),
                                InkWell(
                                  onTap: () {
                                    context.router.replaceNamed('/sidebar');
                                    EasyLoading.showSuccess(
                                        'Successfully Login');
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
                                          borderRadius: 13,
                                          child: Center(
                                            child: Text(
                                              "Verify",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
