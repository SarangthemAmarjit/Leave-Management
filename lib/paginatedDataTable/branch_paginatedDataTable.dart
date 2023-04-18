// import 'package:flutter/material.dart';
// import 'package:leavemanagementadmin/model/branch_list.dart';

// class BranchData extends DataTableSource {
//   BranchData({
//     required List<AllBranchList> dranchdatalist,
//     @required this.onRowSelect,
//   })  : branchData = dranchdatalist,
//         assert(dranchdatalist.isNotEmpty);

//   final List<AllBranchList> branchData;
//   final dynamic onRowSelect;
//  // List<DataCell> displayedDataCell = [];
//   @override
//   DataRow? getRow(int index) {
//     assert(index >= 0);
//     if (index >= branchData.length) {
//       return null;
//     }
//     final branch = branchData[index];
//     return DataRow.byIndex(index: index, cells: <DataCell>[
//        DataCell(Text('${branch.name}')),
//         DataCell(Text('${branch.is}')),
//         DataCell(Text('${branch.email}')),
       
//     ]);
//   }

//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => throw UnimplementedError();

//   @override
//   // TODO: implement rowCount
//   int get rowCount => throw UnimplementedError();

//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => throw UnimplementedError();
// }
