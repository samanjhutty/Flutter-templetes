import 'package:flutter/material.dart';
import 'package:storybar/assets.dart';
import 'package:storybar/story_model.dart';

class StoryBar extends StatefulWidget {
  const StoryBar({super.key});

  @override
  _StoryBarState createState() => _StoryBarState();
}

class _StoryBarState extends State<StoryBar> {
  final double containerHeight = 160;
  final double containerWidth = 120;
  final double addStoryImageHeight = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 8,
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color.fromARGB(255, 222, 222, 222)),
            child: GestureDetector(
              onTap: () {
                showSnackBar('story clicked', context, 1000);
              },
              child: Stack(clipBehavior: Clip.hardEdge, children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image(
                      height: addStoryImageHeight,
                      image: const AssetImage('res/drawable/flower.jpg'),
                      fit: BoxFit.fitHeight),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: addStoryImageHeight * 0.5),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5,
                        color: const Color.fromARGB(255, 222, 222, 222)),
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                )),
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Add to Story',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    )),
              ]),
            ),
          ),
          for (int i = 0; i < modelData.length; i++) ...[
            Container(
              height: containerHeight,
              width: containerWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color.fromARGB(255, 222, 222, 222)),
              child: GestureDetector(
                onTap: () {},
                child: Stack(clipBehavior: Clip.hardEdge, children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Image(
                        image: AssetImage(modelData[i].thumbnailImage),
                        height: containerHeight,
                        fit: BoxFit.fitHeight),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(children: [
                          CircleAvatar(
                              radius: 8,
                              backgroundImage:
                                  AssetImage(modelData[i].avatarImage)),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Text(modelData[i].userName,
                                style: const TextStyle(color: Colors.white)),
                          )
                        ]),
                      )),
                ]),
              ),
            )
          ]
        ],
      ),
    );
  }
}
