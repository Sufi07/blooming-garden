
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/models/blog.dart';
import 'package:practice_app/screens/blog_detail.dart';

import '../dummy_data.dart';

class Blog extends StatefulWidget {
  static const routeName = '/blog-screen';
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    List<BlogData> blogdata = DummyBlog.map((e) => BlogData(
          id: e.id,
          title: e.title,
          asset: e.asset,
          date: e.date,
          parah: e.parah,
        )).toList();
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true, // to center the text in app bar
          title: const Text(
            'Latest Blog',
            style:
                TextStyle(fontFamily: 'PlayFairDisplay', color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: primary_text_one,
          child: ListView.builder(
            itemCount: blogdata.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: "${blogdata[index].asset}",
                          child: Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage("${blogdata[index].asset}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                            child: Text("${blogdata[index].date}",
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display Light',
                                    fontSize: 18)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Text(
                              "${blogdata[index].title}",
                              style: TextStyle(
                                  fontFamily: 'PlayFairDisplay',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "${blogdata[index].parah}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display Light',
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BlogDetail.routeName,
                    arguments: {
                      'imageAsset': blogdata[index].asset,
                      'title': blogdata[index].title,
                      'date': blogdata[index].date,
                      'parah': blogdata[index].parah,
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
