import 'package:employee_attedence_clone/main.dart';
import 'package:employee_attedence_clone/model/leavemodel.dart';
import 'package:flutter/material.dart';

class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  _LeavesState createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  void initState() {
    setTitle = 'Leave Requests';

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            child: SearchBar(
                leading: Icon(Icons.search, color: Colors.grey[400]),
                elevation: const MaterialStatePropertyAll(0),
                hintText: 'Search employee',
                side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.grey[400] as Color)),
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
                hintStyle: MaterialStatePropertyAll(TextStyle(
                    color: Colors.grey[400],
                    textBaseline: TextBaseline.alphabetic))),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: leaveData.length,
                  itemBuilder: (context, i) => Card(
                        elevation: 3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: ListTile(
                                    leading: CircleAvatar(
                                        backgroundColor: Colors.amber[700]),
                                    title: Text(leaveData[i].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    trailing: DefaultTextStyle(
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Applied On'),
                                            Text(leaveData[i].date)
                                          ]),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: primaryColorDark,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: primaryColorDark),
                                                borderRadius:
                                                    BorderRadius.circular(24))),
                                        onPressed: () {},
                                        child: Text(leaveData[i].leaveType))
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Table(children: <TableRow>[
                                    TableRow(children: [
                                      const Text('Leave Date',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                          '${leaveData[i].leavefromDate} - ${leaveData[i].leavetoDate}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    ]),
                                    TableRow(children: [
                                      const Text('Duration',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                      Text('${leaveData[i].duration} - day(s)',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600))
                                    ]),
                                    TableRow(children: [
                                      const Text('Leave Balance',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                      Text('${leaveData[i].balance} - day(s)',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600))
                                    ]),
                                    TableRow(children: [
                                      const Text('Reason',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                      Text(leaveData[i].reason,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600))
                                    ])
                                  ])),
                              Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.teal[50],
                                          foregroundColor: primaryColorDark,
                                          padding: const EdgeInsets.all(24)),
                                      onPressed: leaveData[i].onApproveTap,
                                      child: const Text('APPROVE'),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.red[50],
                                          foregroundColor: Colors.red[700],
                                          padding: const EdgeInsets.all(24)),
                                      onPressed: leaveData[i].onRejectTap,
                                      child: const Text('REJECT'),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: primaryColorDark,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16)),
                                      onPressed: leaveData[i].onEditTap,
                                      child: const Text('EDIT'),
                                    ))
                              ])
                            ]),
                      )))
        ],
      );
}
