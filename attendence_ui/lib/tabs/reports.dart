import 'package:employee_attedence_clone/main.dart';
import 'package:flutter/material.dart';

class CompanyReports extends StatefulWidget {
  const CompanyReports({super.key});

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<CompanyReports> {
  @override
  void initState() {
    setTitle = 'Company Reports';

    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView(children: [
        ExpansionTile(
            childrenPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            title: const Text('Attendence'),
            maintainState: true,
            collapsedIconColor: primaryColorDark,
            textColor: Colors.grey[850],
            iconColor: primaryColorDark,
            initiallyExpanded: true,
            leading: const Icon(Icons.analytics_outlined),
            children: const [
              ListTile(title: Text('Attendence Summary Report')),
              ListTile(title: Text('Detailed Attendence Report')),
              ListTile(title: Text('Late Arrival Report')),
              ListTile(title: Text('Leave Report')),
              ListTile(title: Text('Overtime Report')),
            ]),
        ExpansionTile(
            collapsedIconColor: primaryColorDark,
            textColor: Colors.grey[850],
            iconColor: primaryColorDark,
            childrenPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            title: const Text('Sallery'),
            leading: const Icon(Icons.request_page)),
        ExpansionTile(
            collapsedIconColor: primaryColorDark,
            textColor: Colors.grey[850],
            iconColor: primaryColorDark,
            childrenPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            title: const Text('Notes'),
            leading: const Icon(Icons.edit_note_rounded)),
        ExpansionTile(
            collapsedIconColor: primaryColorDark,
            textColor: Colors.grey[850],
            iconColor: primaryColorDark,
            childrenPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
            title: const Text('Employee List'),
            leading: const Icon(Icons.people_alt_outlined)),
      ]);
}
