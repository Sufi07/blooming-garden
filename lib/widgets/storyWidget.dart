import 'dart:io';

import 'package:practice_app/dummy_data.dart';
import 'package:practice_app/models/storiesData.dart';
import 'package:practice_app/screens/blog_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<StoriesData> stories = DummyStories.map((e) => StoriesData(
          id: e.id,
          title: e.title,
          imageAsset: e.imageAsset,
          category: e.category,
        )).toList();

    return Platform.isIOS
        ? CupertinoButton(
            child: StoryListBuilder(stories: stories),
            onPressed: () {},
          )
        : SizedBox(
            height: 240,
            child: StoryListBuilder(stories: stories),
          );
  }
}

class StoryListBuilder extends StatelessWidget {
  const StoryListBuilder({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoriesData> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BlogDetail.routeName,
              arguments: {
                'imageAsset': stories[index].imageAsset,
                'title': stories[index].title,
                'date': 'May 20, 2020',
                'parah': stories[index].category,
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${stories[index].imageAsset}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 320.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${stories[index].title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontFamily: 'Morganite Bold',
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  '${stories[index].category}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 2.5,
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: 'Morganite Light',
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
