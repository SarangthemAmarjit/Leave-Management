import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';

import 'package:intl/intl.dart';
import 'package:leavemanagementadmin/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:dropdown_search/dropdown_search.dart';

/// The home page of the application which hosts the datagrid.
class HomePage extends StatefulWidget {
  /// Creates the home page.
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  List<Map<String, dynamic>> allemployee = [
    {
      "slno.": "1",
      'name': "Amarjit",
      'branch': "Production",
      "role": "Developer",
      "action": Null
    },
    {
      "slno.": "2",
      'name': "Jc",
      'branch': "Production",
      "role": "Developer",
      "action": Null
    }
  ];

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employees: employees);
    for (var item in allemployee) {
      displayedDataCell.add(
        DataCell(
          Text(
            item['slno.'].toString(),
          ),
        ),
      );
      displayedDataCell.add(
        DataCell(
          Text(
            item['name'].toString(),
          ),
        ),
      );

      displayedDataCell.add(
        DataCell(
          Text(
            item['branch'].toString(),
          ),
        ),
      );
      displayedDataCell.add(
        DataCell(
          Text(
            item['role'].toString(),
          ),
        ),
      );
      displayedDataCell.add(
        DataCell(TextButton(
            onPressed: () {
              empcode.text = item['slno.'];
              _namefieldcontroller.text = item['name'];

              showDialog(
                context: context,
                builder: (cnt) {
                  return StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return AlertDialog(
                        actions: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      side:
                                          const BorderSide(color: Colors.red)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _namefieldcontroller.clear();
                                      datetime2 = '';

                                      dropdownvalue1 = null;
                                      dropdownvalue2 = null;
                                      _position = null;
                                    });
                                  },
                                  child: const Text("CANCEL")),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    onPressed: () async {
                                      EasyLoading.show(status: 'Adding..');
                                      if (_namefieldcontroller.text.isEmpty ||
                                              empcode.text.isEmpty ||
                                              emailcontroller.text.isEmpty ||
                                              empcode.text.isEmpty
                                          // dropdownvalue11 == null ||
                                          // dropdownvalue22 == null ||
                                          // dropdownvalue33==null
                                          ) {
                                        EasyLoading.dismiss();
                                        Navigator.of(context).pop();
                                        CustomSnackBar(
                                            context,
                                            const Text(
                                              'All Fields Are Mandatory',
                                            ),
                                            Colors.red);
                                      } else {
                                        // await ServiceApi()
                                        //     .create_employee(
                                        //         name: _namefieldcontroller.text,
                                        //         desId: dropdownvalue11!,
                                        //         depId: dropdownvalue22!,
                                        //         dob: datetime,
                                        //         token: finaltoken,
                                        //         image: profileimage,
                                        //         location: finallocation!)
                                        //     .whenComplete(() {
                                        //   getdata2().whenComplete(() {
                                        //     _namefieldcontroller.clear();
                                        //     all_desid = [];
                                        //     all_depid = [];
                                        //     all_dep = [];
                                        //     all_des = [];
                                        //     _position = null;
                                        //     datetime2 = '';

                                        //     dropdownvalue1 = null;
                                        //     dropdownvalue2 = null;
                                        //     setState(() {});

                                        //     getcreate_status();
                                        //     getdata();
                                        //     EasyLoading.dismiss();
                                        //     context.router.pop();
                                        //   });
                                        // });

                                        // employeeDataSource._employees.add(
                                        //     Employee(
                                        //         index++,
                                        //         _namefieldcontroller.text,
                                        //         'Production',
                                        //         'Developer',
                                        //         TextButton(
                                        //             onPressed: () {},
                                        //             child:
                                        //                 const Text('Edit'))));
                                        // employeeDataSource.updateDataGridRows();
                                        // employeeDataSource
                                        //     .updateDataGridSource();

                                        allemployee.add({
                                          'name': _namefieldcontroller.text,
                                          'branch': "Production",
                                          "role": "Developer",
                                        });
                                        log(create_statuscode.toString());
                                        //     getcreate_status();
                                        getdata();
                                        EasyLoading.dismiss();
                                        _namefieldcontroller.clear();
                                        emailcontroller.clear();
                                        numbercontroller.clear();
                                        empcode.clear();
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: const Text("ADD")),
                              )
                            ],
                          ),
                        ],
                        title: const Text(
                          "Add new Employee",
                        ),
                        content: SingleChildScrollView(
                          child: Form(
                            child: SizedBox(
                              width: 300,
                              height: 425,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      // const ProfileImagepicker(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: empcode,
                                      decoration: const InputDecoration(
                                        hintText: 'Employee Code',
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _namefieldcontroller,
                                      decoration: const InputDecoration(
                                        hintText: 'Name',
                                      )),
                                  // _dataofbirth(datetime2),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: emailcontroller,
                                      decoration: const InputDecoration(
                                        hintText: 'Email',
                                      )),
                                  // _dataofbirth(datetime2),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: numbercontroller,
                                      decoration: const InputDecoration(
                                        hintText: 'Phone Number',
                                      )),
                                  // _dataofbirth(datetime2),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 240, 237, 237),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 225, 222, 222))),
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        searchFieldProps: const TextFieldProps(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                constraints: BoxConstraints(
                                                    maxHeight: 40))),
                                        constraints: BoxConstraints.tight(
                                            const Size(250, 250)),
                                        showSearchBox: true,
                                        showSelectedItems: true,
                                      ),
                                      items: all_des,
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: "Designation :",
                                          hintText: "Choose Your Designation",
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue1 = newValue as String;
                                        });
                                        int ind =
                                            all_des.indexOf(dropdownvalue1!);
                                        dropdownvalue11 = all_desid[ind];
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 240, 237, 237),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 225, 222, 222))),
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        searchFieldProps: const TextFieldProps(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                constraints: BoxConstraints(
                                                    maxHeight: 40))),
                                        constraints: BoxConstraints.tight(
                                            const Size(250, 250)),
                                        showSearchBox: true,
                                        showSelectedItems: true,
                                      ),
                                      items: all_dep,
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: "Department :",
                                          hintText: "Choose Your Department",
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue2 = newValue as String;
                                        });
                                        int ind =
                                            all_dep.indexOf(dropdownvalue2!);
                                        dropdownvalue22 = all_depid[ind];
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 240, 237, 237),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 225, 222, 222))),
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        searchFieldProps: const TextFieldProps(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                constraints: BoxConstraints(
                                                    maxHeight: 40))),
                                        constraints: BoxConstraints.tight(
                                            const Size(250, 250)),
                                        showSearchBox: true,
                                        showSelectedItems: true,
                                      ),
                                      items: all_des,
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: "Role :",
                                          hintText: "Choose Your Role",
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue3 = newValue as String;
                                        });
                                        int ind =
                                            all_role.indexOf(dropdownvalue3!);
                                        dropdownvalue33 = all_roleid[ind];
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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

  String? dropdownvalue1;
  String? dropdownvalue11;
  String? dropdownvalue22;
  String? dropdownvalue2;
  String? dropdownvalue3;
  String? dropdownvalue33;

  final TextEditingController empcode = TextEditingController();
  final TextEditingController _namefieldcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  final TextEditingController _namefieldcontroller2 = TextEditingController();

  String datetime = '';

  String datetime2 = '';
  String datetime3 = '';
  String datetime4 = '';

  var format = DateFormat("dd-MM-yyyy");

  List<String> all_desid = [];
  List<String> all_depid = [];
  List<String> all_des = [];
  List<String> all_dep = [];
  List<String> all_role = [];
  List<String> all_roleid = [];

  @override
  void dispose() {
    _namefieldcontroller.dispose();
    _namefieldcontroller2.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int del_statuscode = 0;
  int update_statuscode = 0;
  int create_statuscode = 0;

  String? latitude;
  String? longitude;
  String? finallocation;

  String profileimage = '';

  Position? _position;

  bool clicked = false;
  Container conta = Container(
    child: const Text(
      'No Location Data',
    ),
  );

  getdel_status() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      del_statuscode = prefs.getInt('emp_deletecode')!;
    });
    if (del_statuscode == 204) {
      CustomSnackBar(context, const Text('Deleted Successfully'), Colors.green);
    } else {
      CustomSnackBar(context, const Text('Error'), Colors.red);
    }
  }

  getupdate_status() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      update_statuscode = prefs.getInt('emp_updatecode')!;
    });
    if (update_statuscode == 201 || update_statuscode == 200) {
      CustomSnackBar(
          context, const Text('Updated Employee Successfully'), Colors.green);
    } else {
      CustomSnackBar(context, const Text('Error'), Colors.red);
    }
  }

  getcreate_status() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      create_statuscode = prefs.getInt('emp_createcode')!;
      log(create_statuscode.toString());
    });
    if (create_statuscode == 201 || create_statuscode == 200) {
      CustomSnackBar(
          context, const Text('Added Employee Successfully'), Colors.green);
    } else {
      CustomSnackBar(context, const Text('Error'), Colors.red);
    }
  }

  final GlobalKey<FormFieldState> _keydep = GlobalKey();
  final GlobalKey<FormFieldState> _keydes = GlobalKey();

  String finaltoken = '';
  DateTime? initialdate = DateTime(2010);
  Future getdata() async {
    final prefs = await SharedPreferences.getInstance();
    String tokken = prefs.getString('tokken')!;
    // final datafinal = await ServiceApi().Get_employee(token: tokken);
    // final datafinal2 = await ServiceApi().Get_designation(token: tokken);
    // final datafinal3 = await ServiceApi().Get_department(token: tokken);
    setState(() {
      // newlist = datafinal!;
      // newlist2 = datafinal2!;
      // newlist3 = datafinal3!;
      finaltoken = tokken;
    });
    // for (var element in newlist2) {
    //   all_desid.add(element.id.toString());
    // }
    // for (var element in newlist3) {
    //   all_depid.add(element.id.toString());
    // }
    // for (var element in newlist2) {
    //   all_des.add(element.name.toString());
    // }
    // for (var element in newlist3) {
    //   all_dep.add(element.name.toString());
    // }
    log(all_dep.toString());
    log(all_des.toString());
  }

  Future getdata2() async {
    final prefs = await SharedPreferences.getInstance();
    String tokken = prefs.getString('tokken')!;
    // final datafinal = await ServiceApi().Get_employee(token: tokken);
    // final datafinal2 = await ServiceApi().Get_designation(token: tokken);
    // final datafinal3 = await ServiceApi().Get_department(token: tokken);
    setState(() {
      // newlist = datafinal!;
      // newlist2 = datafinal2!;
      // newlist3 = datafinal3!;
      finaltoken = tokken;
    });

    log(all_dep.toString());
    log(all_des.toString());
  }

  List<DataCell> displayedDataCell = [];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    String size = MediaQuery.of(context).size.width.toString();
    print("Size : $size");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 249, 119, 109),
      //   title: const Text(
      //     'Globizs Emp Leave Management Admin',
      //   ),
      // ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Center(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Image.asset(
        //         'assets/images/G.png',
        //         height: 70,
        //       ),
        //       const Text(
        //         'Leave Management System',
        //         style: TextStyle(fontSize: 20),
        //       ),
        //       const SizedBox(
        //         height: 5,
        //       ),
        //       const Text(
        //         'Admin Panel',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //       ),
        //     ],
        //   ),
        // ),

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
          child: const Text(
            'Employee ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: MediaQuery.of(context).size.width > 1040
              ? const EdgeInsets.only(left: 100, top: 15)
              : const EdgeInsets.only(left: 10, top: 15),
          child: InkWell(
              onTap: () {
                _namefieldcontroller.clear();
                emailcontroller.clear();
                numbercontroller.clear();
                empcode.clear();
                showDialog(
                  context: context,
                  builder: (cnt) {
                    return StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return AlertDialog(
                          actions: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                        side: const BorderSide(
                                            color: Colors.red)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        _namefieldcontroller.clear();
                                        datetime2 = '';

                                        dropdownvalue1 = null;
                                        dropdownvalue2 = null;
                                        _position = null;
                                      });
                                    },
                                    child: const Text("CANCEL")),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green),
                                      onPressed: () async {
                                        EasyLoading.show(status: 'Adding..');
                                        if (_namefieldcontroller.text.isEmpty ||
                                                empcode.text.isEmpty ||
                                                emailcontroller.text.isEmpty ||
                                                empcode.text.isEmpty
                                            // dropdownvalue11 == null ||
                                            // dropdownvalue22 == null ||
                                            // dropdownvalue33==null
                                            ) {
                                          EasyLoading.dismiss();
                                          Navigator.of(context).pop();
                                          CustomSnackBar(
                                              context,
                                              const Text(
                                                'All Fields Are Mandatory',
                                              ),
                                              Colors.red);
                                        } else {
                                          // await ServiceApi()
                                          //     .create_employee(
                                          //         name: _namefieldcontroller.text,
                                          //         desId: dropdownvalue11!,
                                          //         depId: dropdownvalue22!,
                                          //         dob: datetime,
                                          //         token: finaltoken,
                                          //         image: profileimage,
                                          //         location: finallocation!)
                                          //     .whenComplete(() {
                                          //   getdata2().whenComplete(() {
                                          //     _namefieldcontroller.clear();
                                          //     all_desid = [];
                                          //     all_depid = [];
                                          //     all_dep = [];
                                          //     all_des = [];
                                          //     _position = null;
                                          //     datetime2 = '';

                                          //     dropdownvalue1 = null;
                                          //     dropdownvalue2 = null;
                                          //     setState(() {});

                                          //     getcreate_status();
                                          //     getdata();
                                          //     EasyLoading.dismiss();
                                          //     context.router.pop();
                                          //   });
                                          // });

                                          // employeeDataSource._employees.add(
                                          //     Employee(
                                          //         index++,
                                          //         _namefieldcontroller.text,
                                          //         'Production',
                                          //         'Developer',
                                          //         TextButton(
                                          //             onPressed: () {},
                                          //             child:
                                          //                 const Text('Edit'))));
                                          // employeeDataSource.updateDataGridRows();
                                          // employeeDataSource
                                          //     .updateDataGridSource();

                                          allemployee.add({
                                            'name': _namefieldcontroller.text,
                                            'branch': "Production",
                                            "role": "Developer",
                                          });
                                          log(create_statuscode.toString());
                                          //     getcreate_status();
                                          getdata();
                                          EasyLoading.dismiss();
                                          _namefieldcontroller.clear();
                                          emailcontroller.clear();
                                          numbercontroller.clear();
                                          empcode.clear();
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text("ADD")),
                                )
                              ],
                            ),
                          ],
                          title: const Text(
                            "Add new Employee",
                          ),
                          content: SingleChildScrollView(
                            child: Form(
                              child: SizedBox(
                                width: 300,
                                height: 425,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        // const ProfileImagepicker(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: empcode,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 211, 211)),
                                          hintText: 'Employee Code',
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: _namefieldcontroller,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 211, 211)),
                                          hintText: 'Name',
                                        )),
                                    // _dataofbirth(datetime2),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: emailcontroller,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 211, 211)),
                                          hintText: 'Email',
                                        )),
                                    // _dataofbirth(datetime2),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: numbercontroller,
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 211, 211)),
                                          hintText: 'Phone Number',
                                        )),
                                    // _dataofbirth(datetime2),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 240, 237, 237),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 225, 222, 222))),
                                      child: DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          searchFieldProps:
                                              const TextFieldProps(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 40))),
                                          constraints: BoxConstraints.tight(
                                              const Size(250, 250)),
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),
                                        items: all_des,
                                        dropdownDecoratorProps:
                                            const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Designation :",
                                            hintText: "Choose Your Designation",
                                          ),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue1 = newValue as String;
                                          });
                                          int ind =
                                              all_des.indexOf(dropdownvalue1!);
                                          dropdownvalue11 = all_desid[ind];
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 240, 237, 237),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 225, 222, 222))),
                                      child: DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          searchFieldProps:
                                              const TextFieldProps(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 40))),
                                          constraints: BoxConstraints.tight(
                                              const Size(250, 250)),
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),
                                        items: all_dep,
                                        dropdownDecoratorProps:
                                            const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Department :",
                                            hintText: "Choose Your Department",
                                          ),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue2 = newValue as String;
                                          });
                                          int ind =
                                              all_dep.indexOf(dropdownvalue2!);
                                          dropdownvalue22 = all_depid[ind];
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 240, 237, 237),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 225, 222, 222))),
                                      child: DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          searchFieldProps:
                                              const TextFieldProps(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      constraints:
                                                          BoxConstraints(
                                                              maxHeight: 40))),
                                          constraints: BoxConstraints.tight(
                                              const Size(250, 250)),
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),
                                        items: all_des,
                                        dropdownDecoratorProps:
                                            const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Role :",
                                            hintText: "Choose Your Role",
                                          ),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue3 = newValue as String;
                                          });
                                          int ind =
                                              all_role.indexOf(dropdownvalue3!);
                                          dropdownvalue33 = all_roleid[ind];
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                    borderRadius: 2,
                    child: Center(
                      child: Text(
                        'Add Employee',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: MediaQuery.of(context).size.width > 1040
                ? const EdgeInsets.only(left: 100, right: 100, top: 20)
                : const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columnSpacing: MediaQuery.of(context).size.width > 900 ? 50 : 2,
                dividerThickness: 2,
                headingRowColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(0.2)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 3,
                          offset: const Offset(0, 3))
                    ]),
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                rows: <DataRow>[
                  for (int i = 0; i < displayedDataCell.length; i += 5)
                    DataRow(cells: [
                      displayedDataCell[i],
                      displayedDataCell[i + 1],
                      displayedDataCell[i + 2],
                      displayedDataCell[i + 3],
                      displayedDataCell[i + 4]
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
                        'Employee Name',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Branch',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Role',
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
        const SizedBox(
          height: 50,
        ),
      ]),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(index, 'Puspa', 'Production', 'Developer',
          TextButton(onPressed: () {}, child: const Text('Edit'))),
    ];
  }
}

class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.role, this.button);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final String role;
  final TextButton button;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employees}) {
    _employees = employees;
    updateDataGridRows();
  }

  List<DataGridRow> dataGridRow = [];
  late List<Employee> _employees;
  Color? rowBackgroundColor;

  void updateDataGridRows() {
    dataGridRow = _employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'sl', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'branch', value: dataGridRow.designation),
              DataGridCell<String>(columnName: 'role', value: dataGridRow.role),
              DataGridCell(columnName: 'action', value: dataGridRow.button),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRow;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
