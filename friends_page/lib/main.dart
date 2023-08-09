import 'package:flutter/material.dart';
import 'package:friends_page/friends_model.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Friends Page',
        home: Scaffold(
            appBar: AppBar(title: const Text('Friends')),
            body: const Home(title: 'Friends')));
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: const [
                  Text('Friends',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Icon(Icons.people_alt_rounded)
                ]),
            const Icon(Icons.search)
          ]),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: friendsData.length,
                  itemBuilder: (context, i) => ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(friendsData[i].profileImage)),
                        title: Text(friendsData[i].username),
                        subtitle: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.start,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 50),
                                    backgroundColor: Colors.grey[300],
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                onPressed: () => friendsData[i].reqAccept,
                                child: const Text('Accept')),
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 50),
                                    backgroundColor: Colors.grey[300],
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                                onPressed: () => setState(() {
                                      friendsData.remove(friendsData[i]);
                                    }),
                                child: const Text('Delete'))
                          ],
                        ),
                      )))
        ],
      ),
    );
  }
}
