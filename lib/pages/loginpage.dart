import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:leavemanagementadmin/constant/alertbox.dart';
import 'package:leavemanagementadmin/logic/loginCubit/cubit/login_verifybymail_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController verifyemailcontroller = TextEditingController();
  TextEditingController verifymailotpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var c = context.watch<LoginVerifybymailCubit>();
    return BlocConsumer<LoginVerifybymailCubit, VerifyStatusformail>(
        listener: (context, state) {
      switch (state) {
        case VerifyStatusformail.initial:
          log('Initial');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case VerifyStatusformail.loading:
          log('Loading');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case VerifyStatusformail.loaded:
          Navigator.pop(context);
          EasyLoading.showToast(
            'Successfully Login',
          );

          context.router.replaceNamed('/sidebar');
          break;

        case VerifyStatusformail.error:
          context.router.pop();
          EasyLoading.showError(
            "Invalid OTP",
          );

          break;
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Center(
          child: Card(
            color: Colors.grey[100],
            elevation: 20,
            child: SizedBox(
              height: height / 1.8,
              width: width <= 700 ? width / 1.2 : width / 1.8,
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
                                Padding(
                                  padding: width <= 600
                                      ? const EdgeInsets.symmetric(
                                          vertical: 2.0)
                                      : const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                  child: width <= 1000
                                      ? const Text(
                                          "Leave Management System",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      : const Text(
                                          "Leave Management System",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                ),
                                width <= 1000
                                    ? const Text("Admin Panel",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))
                                    : const Text(
                                        "Admin Panel",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
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
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: height / 32,
                                  ),
                                  TextFormField(
                                    controller: verifyemailcontroller,
                                    autovalidateMode: AutovalidateMode.always,
                                    autofillHints: const [AutofillHints.email],
                                    //not for form, this will make the input suggest that the field wants email as input
                                    decoration: InputDecoration(
                                        // fillColor: Colors.amber,
                                        suffix: TextButton(
                                            // style: TextButton.styleFrom(
                                            //     backgroundColor: Colors.blue),
                                            onPressed: () {},
                                            child: Text(
                                              "Send OTP",
                                              style: TextStyle(
                                                  color: Colors.red[900],
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        prefixIcon: const Icon(
                                            Icons.account_circle_outlined),
                                        border: const OutlineInputBorder(),
                                        labelText: "Enter email/ Phone no. :",
                                        hintText: "example@globizs.com",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),

                                    cursorColor: Colors.red,
                                  ),
                                  SizedBox(
                                    height: height / 48,
                                  ),
                                  TextFormField(
                                    controller: verifymailotpcontroller,
                                    autovalidateMode: AutovalidateMode.always,
                                    autofillHints: const [AutofillHints.email],
                                    //not for form, this will make the input suggest that the field wants email as input
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.lock_outline_rounded),
                                        border: const OutlineInputBorder(),
                                        labelText: "OTP : ",
                                        hintText: " Enter OTP",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),

                                    cursorColor: Colors.red,
                                  ),
                                  SizedBox(
                                    height: height / 46,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Time remaining : "),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Resend OTP",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 46,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<LoginVerifybymailCubit>()
                                          .verifymail(
                                              email: verifyemailcontroller.text,
                                              otp:
                                                  verifymailotpcontroller.text);
                                    },
                                    child: Center(
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
    });
  }
}
