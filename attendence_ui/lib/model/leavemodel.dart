import 'package:flutter/material.dart';

class LeaveModel {
  String name;
  String date;
  String leaveType;
  String leavefromDate;
  String leavetoDate;
  String reason;
  int duration;
  int? balance;
  VoidCallback onApproveTap;
  VoidCallback onRejectTap;
  VoidCallback onEditTap;

  LeaveModel(
      {required this.name,
      required this.date,
      required this.leaveType,
      required this.leavefromDate,
      required this.leavetoDate,
      required this.reason,
      required this.balance,
      required this.duration,
      required this.onApproveTap,
      required this.onRejectTap,
      required this.onEditTap});
}

List<LeaveModel> leaveData = [
  LeaveModel(
      name: 'Abhay Kumar',
      date: '19 Nov 2022',
      leaveType: 'Sick Leave',
      leavefromDate: '19 Nov',
      leavetoDate: '19 Nov 2022',
      reason: 'High fever',
      duration: 1,
      balance: 0,
      onApproveTap: () => debugPrint('Approve clicked'),
      onRejectTap: () => debugPrint('Reject clicked'),
      onEditTap: () => debugPrint('Edit clicked')),
  LeaveModel(
      name: 'Abhijit Kumar',
      date: '19 Nov 2022',
      leaveType: 'Unpaid Leave',
      leavefromDate: '19 Nov',
      leavetoDate: '19 Nov 2022',
      duration: 1,
      balance: 1,
      reason: 'Going to village due to urgency',
      onApproveTap: () => debugPrint('Approve clicked'),
      onRejectTap: () => debugPrint('Reject clicked'),
      onEditTap: () => debugPrint('Edit clicked')),
  LeaveModel(
      name: 'Abhisekh Thakur',
      date: '19 Nov 2022',
      leaveType: 'Paid Leave',
      leavefromDate: '22 Nov',
      leavetoDate: '30 Nov 2022',
      duration: 6,
      balance: 7,
      reason: "Sister's Marrige",
      onApproveTap: () => debugPrint('Approve clicked'),
      onRejectTap: () => debugPrint('Reject clicked'),
      onEditTap: () => debugPrint('Edit clicked')),
];
