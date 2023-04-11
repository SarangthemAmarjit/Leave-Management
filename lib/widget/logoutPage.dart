import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
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
            width: width <= 700 ? width / 1.2 : width / 1.8,
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[100],
                      height: height / 4,
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
                                padding: width <= 1000
                                    ? const EdgeInsets.symmetric(vertical: 3.0)
                                    : const EdgeInsets.symmetric(vertical: 8.0),
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
                                  ? const Text(
                                      "Admin Panel",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
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
                      child: Column(children: [
                        Padding(
                          padding: width <= 1300
                              ? const EdgeInsets.symmetric(horizontal: 6.0)
                              : const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Form(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 120,
                              ),
                              const Text(
                                "Logout ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.router.replaceNamed('/sidebar');
                                      },
                                      child: Card(
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          //set border radius more than 50% of height and width to make circle
                                        ),
                                        child: Center(
                                          child: CardWidget(
                                            gradient: const [
                                              Color.fromARGB(
                                                  255, 219, 217, 217),
                                              Color.fromARGB(255, 246, 244, 244)
                                            ],
                                            width: width <= 1200 ? 80 : 120,
                                            height: height <= 1200 ? 27 : 32,
                                            borderRadius: 13,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                width <= 1200
                                                    ? const Icon(
                                                        Icons.cancel,
                                                        color: Colors.grey,
                                                        size: 13,
                                                      )
                                                    : const Icon(
                                                        Icons.cancel,
                                                        color: Colors.grey,
                                                      ),
                                                width <= 1200
                                                    ? const Text(
                                                        "Not now",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      )
                                                    : const Text(
                                                        "Not now",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.remove('tokken').whenComplete(
                                            () => context.router
                                                .replaceNamed('/emailinput'));
                                      },
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          //set border radius more than 50% of height and width to make circle
                                        ),
                                        child: CardWidget(
                                            gradient: const [
                                              Color.fromARGB(255, 211, 32, 39),
                                              Color.fromARGB(255, 164, 92, 95)
                                            ],
                                            width: width <= 1200 ? 80 : 120,
                                            height: height <= 1200 ? 27 : 32,
                                            borderRadius: 13,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  width <= 1200
                                                      ? const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color: Colors.white,
                                                          size: 13,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color: Colors.white,
                                                        ),
                                                  width <= 1200
                                                      ? const Text(
                                                          "Confirm",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      : const Text(
                                                          "Confirm",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
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
