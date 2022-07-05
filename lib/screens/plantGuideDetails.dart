// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:practice_app/constant/constant_color.dart';
import 'package:flutter/material.dart';

class Plantguidedetails extends StatefulWidget {
  static const routeName = '/plant-guide-detail';

  @override
  _PlantguidedetailsState createState() => _PlantguidedetailsState();
}

class _PlantguidedetailsState extends State<Plantguidedetails> {
  String? title;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs['title'];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                child: Container(),
                preferredSize: const Size(0, 20),
              ),
              pinned: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/pgfour.jpg'),
                    ),
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  Positioned(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 23),
                                child: Text(
                                  '12 Feb 2020',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            title!,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'PlayFairDisplay',
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 100,
                                            softWrap: false,
                                            style: TextStyle(
                                              fontFamily: 'PlayFairDisplay',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero. Vivamus a viverra risus, et tempus tellus. Mauris semper, tortor et laoreet blandit, mauris mauris mollis quam, et faucibus magna libero non enim.',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 50,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily:
                                                    'SF Pro Display Light',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            'Mauris ullamcorper tempus ligula, vel consectetur eros viverra non. Fusce interdum enim efficitur eleifend laoreet. Etiam nunc lectus, tempus a auctor in, feugiat et augue. Proin justo urna, blandit luctus quam quis, mollis ultrices nibh. Pellentesque commodo erat sit amet interdum pharetra. Praesent nec dui id dui molestie feugiat ut at sapien. Etiam nec justo sit amet mi molestie aliquet ut eu urna. Vestibulum ac fringilla lectus. Nullam nibh nisl, scelerisque eget ornare non, pretium id ante.',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 50,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily:
                                                    'SF Pro Display Lighty',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 15, 15, 20),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text("Share",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'PlayFairDisplay',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Scaffold.of(context)
                                                      // ignore: deprecated_member_use
                                                      .showSnackBar(
                                                    new SnackBar(
                                                      content: new Text(
                                                          'Facebook Page is Under Development.'),
                                                    ),
                                                  );
                                                },
                                                color: Colors.black,
                                                height: 60,
                                                shape: CircleBorder(),
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/icons/facebook.png"),
                                                  height: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Scaffold.of(context)
                                                      // ignore: deprecated_member_use
                                                      .showSnackBar(
                                                          new SnackBar(
                                                    content: new Text(
                                                        'Twitter Page is Under Development.'),
                                                  ));
                                                },
                                                color: Colors.black,
                                                height: 60,
                                                shape: CircleBorder(),
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/icons/twitter.png"),
                                                  height: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
