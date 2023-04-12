import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:leavemanagementadmin/constant/alertbox.dart';
import 'package:leavemanagementadmin/constant/login_emailcheck.dart';
import 'package:leavemanagementadmin/constant/login_numbercheck.dart';
import 'package:leavemanagementadmin/logic/loginCubit/cubit/login_bymail_cubit.dart';

@RoutePage()
class EmailInputPage extends StatefulWidget {
  const EmailInputPage({super.key});

  @override
  State<EmailInputPage> createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<EmailInputPage> {
  TextEditingController emailorphoncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var c = context.watch<LoginBymailCubit>();
    return BlocConsumer<LoginBymailCubit, SendingotpStatusformail>(
        listener: (context, state) {
      switch (state) {
        case SendingotpStatusformail.initial:
          log('Initial');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case SendingotpStatusformail.loading:
          log('Loading');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return alertbox;
            },
          );
          break;

        case SendingotpStatusformail.loaded:
          Navigator.pop(context);
          EasyLoading.showToast(
            'otp has been sent to your email',
          );

          context.router.replaceNamed('/login');
          break;

        case SendingotpStatusformail.error:
          context.router.pop();
          EasyLoading.showError(' "Invalid Email or Password",');

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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: width < 1000
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
                                width <= 600
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
                              height: height / 3.6,
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
                                    controller: emailorphoncontroller,
                                    autovalidateMode: AutovalidateMode.always,
                                    autofillHints: const [AutofillHints.email],
                                    //not for form, this will make the input suggest that the field wants email as input
                                    decoration: const InputDecoration(
                                        // fillColor: Colors.amber,
                                        prefixIcon:
                                            Icon(Icons.account_circle_outlined),
                                        border: OutlineInputBorder(),
                                        labelText: "Email/Phone No. :",
                                        hintText: "example@gmail.com"),

                                    cursorColor: Colors.red,
                                  ),
                                  SizedBox(
                                    height: height / 46,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (isEmail(emailorphoncontroller.text)) {
                                        context
                                            .read<LoginBymailCubit>()
                                            .emaillogin(
                                                email:
                                                    emailorphoncontroller.text);
                                        //send email to api
                                      } else if (isValidPhoneNumber(
                                          emailorphoncontroller.text)) {
                                        //send phone to api
                                        context.router.replaceNamed('/login');
                                      } else {
                                        EasyLoading.showToast(
                                            "Invalid Email or Phone Number");
                                      }
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
                                                "Send OTP",
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
