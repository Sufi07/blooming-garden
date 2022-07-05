import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/dummy_data.dart';
import 'package:practice_app/models/notificationM.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  static const routeName = '/notification-screen';
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    List<NotificationClass> notifications =
        DummyNotification.map((e) => NotificationClass(
              id: e.id,
              name: e.name,
              details: e.details,
              type: e.type,
              time: e.time,
            )).toList();

    return Scaffold(
      // builder: (context)
      body: Builder(
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
                  preferredSize: Size(0, 20),
                ),
                pinned: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/storytwo.jpg")),
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0),
                    Positioned(
                      child: Center(
                        child: Container(
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Morganite Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 75,
                            ),
                          ),
                        ),
                      ),
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
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    left: 25.0,
                                    right: 25.0,
                                    bottom: 15.0,
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${notifications[index].name} ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SF Pro Display Light',
                                            color: primary_text_two,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${notifications[index].details}',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'SF Pro Display Light',
                                            color: primary_text_two,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0, bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${notifications[index].type}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          fontFamily: 'SF Pro Display Light',
                                          color: primary_text_two,
                                        ),
                                      ),
                                      Text(
                                        "${notifications[index].time}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'SF Pro Display Light',
                                          color: primary_text_two,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  height: 15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
