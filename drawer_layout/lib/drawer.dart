import 'package:drawer_layout/assets.dart';
import 'package:drawer_layout/profile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          SizedBox(
              height: 100,
              child: DrawerHeader(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        hoverColor: Colors.transparent,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'Menu',
                            style: TextStyle(fontSize: 18),
                          )),
                      IconButton(
                          onPressed: () {
                            showSnackBarAsBottomSheet(
                                context, 'Search Pressed');
                          },
                          icon: const Icon(Icons.search_rounded)),
                    ]),
              )),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/user.png')),
                  title: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('view your profile'),
                  onTap: () => gotoPage(const MyProfilePage()),
                ),
                const Divider(thickness: 1),
                const ListTile(
                    leading: Icon(
                      Icons.coronavirus,
                      color: Colors.red,
                    ),
                    title: Text('Covid-19 Information Center'),
                    subtitle: Text('Information about coronvirus outbreak')),
                const ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                  title: Text('Messages'),
                  subtitle: Text('see messages from friends'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Colors.green,
                  ),
                  title: Text('Groups'),
                  subtitle: Text('see groups'),
                ),
                const ListTile(
                    leading: Icon(
                      Icons.store,
                      color: Colors.green,
                    ),
                    title: Text('Market'),
                    subtitle: Text('visit marketspace')),
                const ListTile(
                    leading: Icon(
                      Icons.people,
                      color: Colors.green,
                    ),
                    title: Text('Friends'),
                    subtitle: Text('see your friends')),
                const ListTile(
                    leading: Icon(
                      Icons.message,
                      color: Colors.green,
                    ),
                    title: Text('Pages'),
                    subtitle: Text('see pages you follow')),
                const Divider(thickness: 1),
                const ListTile(
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: Text('Settings')),
                const ListTile(
                  leading: Icon(
                    Icons.message,
                  ),
                  title: Text('Privacy'),
                ),
                const ListTile(
                    leading: Icon(
                      Icons.info_rounded,
                    ),
                    title: Text('About')),
                const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text('Logout'))
              ],
            ),
          )
        ]));
  }
}
