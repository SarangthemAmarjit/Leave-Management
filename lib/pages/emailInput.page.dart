import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leavemanagementadmin/constant.dart';

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
                                // if (isEmail(emailorphoncontroller.text)) {
                                //   context
                                //       .read()
                                //       .context
                                //       .router
                                //       .replaceNamed('/login');
                                // } else if (isValidPhoneNumber(
                                //     emailorphoncontroller.text)) {
                                //   //send phone to api
                                //   context.router.replaceNamed('/login');
                                // } else {
                                //   EasyLoading.showToast(
                                //       "Invalid Email or Phone Number");
                                // }
                                context.router.replaceNamed('/sidebar');
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
                )
              : SizedBox(
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Center(
                                child: SizedBox(
                                  // color: Colors.amber,
                                  height: height / 3.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        autofillHints: const [
                                          AutofillHints.email
                                        ],
                                        //not for form, this will make the input suggest that the field wants email as input
                                        decoration: const InputDecoration(
                                            // fillColor: Colors.amber,
                                            prefixIcon: Icon(
                                                Icons.account_circle_outlined),
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
                                          // if (isEmail(emailorphoncontroller.text)) {
                                          //   context
                                          //       .read()
                                          //       .context
                                          //       .router
                                          //       .replaceNamed('/login');
                                          // } else if (isValidPhoneNumber(
                                          //     emailorphoncontroller.text)) {
                                          //   //send phone to api
                                          //   context.router.replaceNamed('/login');
                                          // } else {
                                          //   EasyLoading.showToast(
                                          //       "Invalid Email or Phone Number");
                                          // }
                                          context.router
                                              .replaceNamed('/sidebar');
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
                                                  Color.fromARGB(
                                                      255, 211, 32, 39),
                                                  Color.fromARGB(
                                                      255, 164, 92, 95)
                                                ],
                                                width: 340,
                                                height: 48,
                                                borderRadius: 13,
                                                child: Center(
                                                  child: Text(
                                                    "Send OTP",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
