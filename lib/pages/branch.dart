import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:leavemanagementadmin/logic/branch/create_branch_cubit.dart';
import 'package:leavemanagementadmin/logic/branch/getallbranch_cubit.dart';

import 'package:leavemanagementadmin/model/branch_list.dart';

class BranchPage extends StatefulWidget {
  /// Creates the home page.
  const BranchPage({Key? key}) : super(key: key);

  @override
  _BranchPageState createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  TextEditingController namecontroller = TextEditingController();
  bool isactive = false;
  final String avtive = "";

  // List<Map<String, dynamic>> allbranch = [
  //   {"slno.": "1", "branchname": "Imphal East", "is_active": true},
  //   {"slno.": "2", "branchname": "Imphal west", "is_active": false}
  // ];
  List<DataCell> displayedDataCell = [];

  @override
  void initState() {
    super.initState();
    context.read<GetallbranchCubit>().getallbranch();
  }
  // get branch list

  void getbranchlist(List<AllBranchList> getbranchlist) async {
    for (var item in getbranchlist) {
      displayedDataCell.add(
        DataCell(
          Text(
            (getbranchlist.indexOf(item) + 1).toString(),
          ),
        ),
      );
      displayedDataCell.add(
        DataCell(
          Text(item.name),
        ),
      );

      displayedDataCell.add(
        DataCell(
          Text(item.isActive),
        ),
      );

      displayedDataCell.add(
        DataCell(TextButton(
            onPressed: () {
              namecontroller.text = item.name;
              isactive = item.isActive as bool;
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return AlertDialog(
                        title: const Text(
                          "Add new Branch",
                          style: TextStyle(fontSize: 18),
                        ),
                        content: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: namecontroller,
                                decoration: const InputDecoration(
                                  hintText: "Branch Name",
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const Text("Active : "),
                                  Switch(
                                    value: isactive,
                                    activeColor:
                                        const Color.fromARGB(255, 72, 217, 77),
                                    onChanged: (bool value) {
                                      setState(() {
                                        isactive = value;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(fontSize: 17),
                                  )),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                  onPressed: () {
                                    if (namecontroller.text.isEmpty) {
                                      EasyLoading.showError(
                                          'Name field is empty');
                                    } else {
                                      namecontroller.clear();
                                      isactive = false;
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    "Update",
                                    style: TextStyle(fontSize: 17),
                                  )),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              );
            },
            child: const Icon(Icons.edit))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetallbranchCubit, GetallbranchState>(
      listener: (context, state) {
        getbranchlist(state.allbranchlist);
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          body: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: MediaQuery.of(context).size.width > 1040
                  ? const EdgeInsets.only(
                      left: 100,
                    )
                  : const EdgeInsets.only(
                      left: 10,
                    ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Branch",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: MediaQuery.of(context).size.width > 1040
                  ? const EdgeInsets.only(left: 100, top: 15)
                  : const EdgeInsets.only(left: 10, top: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      namecontroller.clear();
                      isactive = false;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return AlertDialog(
                                title: const Text(
                                  "Add new Branch",
                                  style: TextStyle(fontSize: 18),
                                ),
                                content: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: namecontroller,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 211, 211)),
                                          hintText: "Branch Name",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     const Text("Active : "),
                                      //     Switch(
                                      //       value: isactive,
                                      //       activeColor: const Color.fromARGB(
                                      //           255, 72, 217, 77),
                                      //       onChanged: (bool value) {
                                      //         setState(() {
                                      //           isactive = value;
                                      //         });
                                      //       },
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[300],
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Colors.blueGrey),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            if (namecontroller.text.isEmpty ||
                                                namecontroller.text.isEmpty) {
                                              EasyLoading.showError(
                                                  'Name field is empty');
                                            } else {
                                              // allbranch.add({
                                              //   "slno.": index,
                                              //   "branchname": namecontroller.text,
                                              //   "is_active": isactive == true
                                              //       ? "Active"
                                              //       : "Not Active",
                                              // });

                                              context
                                                  .read<BranchCubit>()
                                                  .addbranch(
                                                    branchname:
                                                        namecontroller.text,
                                                    //isactive: isactive ? "1" : "0",
                                                  );

                                              namecontroller.clear();
                                              isactive = false;

                                              Navigator.pop(context);
                                              EasyLoading.showToast(
                                                  "Successfully added");
                                            }
                                          },
                                          child: Material(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                            ),
                                            elevation: 15,
                                            child: const CardWidget(
                                                color: Colors.green,
                                                width: 70,
                                                height: 30,
                                                borderRadius: 5,
                                                child: Center(
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          )),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 15,
                      child: const CardWidget(
                          gradient: [
                            Color.fromARGB(255, 211, 32, 39),
                            Color.fromARGB(255, 164, 92, 95)
                          ],
                          width: 120,
                          height: 40,
                          borderRadius: 13,
                          child: Center(
                            child: Text(
                              'Add Branch',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    )),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: MediaQuery.of(context).size.width > 1040
                          ? const EdgeInsets.only(
                              left: 100, right: 100, top: 20)
                          : const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DataTable(
                          dividerThickness: 2,
                          headingTextStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey.withOpacity(0.2)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          // border: TableBorder.all(
                          //     color: const Color.fromARGB(255, 159, 154, 154)),
                          rows: <DataRow>[
                            for (int i = 0;
                                i < displayedDataCell.length;
                                i += 4)
                              DataRow(cells: [
                                displayedDataCell[i],
                                displayedDataCell[i + 1],
                                displayedDataCell[i + 2],
                                displayedDataCell[i + 3],
                              ])
                          ],
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Sl.no',
                              ),
                            ),
                            DataColumn(
                              label: Flexible(
                                child: Text(
                                  'Branch Name',
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Is_Active',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Action',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}