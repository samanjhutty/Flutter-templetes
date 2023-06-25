import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:posts/post_model.dart';

class Post extends StatefulWidget {
  const Post({super.key});
  @override
  PostState createState() => PostState();
}

class PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < postData.length; i++) ...[
        const Divider(thickness: 3, color: Colors.black54),
        ListTile(
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(postData[i].avatarImage),
            ),
            onPressed: () => postData[i].avatarOnTap,
          ),
          title: TextButton(
            style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.black87),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.centerLeft,
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () => postData[i].avatarOnTap,
            child: Text(postData[i].username,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          subtitle: Text(postData[i].time),
          trailing: IconButton(
            onPressed: () => postData[i].moreOnTap,
            icon: const Icon(Icons.more_horiz),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: ExpandableText(postData[i].caption,
                expandText: 'show more', collapseText: 'show less')),
        GestureDetector(
            onDoubleTap: (() => postData[i].imageOnTap),
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: NetworkImage(postData[i].postImage),
              fit: BoxFit.fitWidth,
            )),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Wrap(spacing: 8, children: [
            TextButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
                  backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.black54),
                ),
                onPressed: () => postData[i].likeOnTap,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: const [Icon(Icons.thumb_up_rounded), Text('Like')],
                )),
            TextButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                    backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black54)),
                onPressed: () => postData[i].likeOnTap,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: const [Icon(Icons.comment), Text('Comment')],
                )),
            TextButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                    backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black54)),
                onPressed: () => postData[i].likeOnTap,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: const [Icon(Icons.share), Text('Share')],
                )),
          ]),
        )
      ]
    ]);
  }
}
