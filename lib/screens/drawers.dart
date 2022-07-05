// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:convert';
import 'package:practice_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/models/moreContent.dart';
import 'package:practice_app/constant/constant_color.dart';
import 'package:practice_app/screens/authScreen.dart';
import 'package:practice_app/screens/notifications.dart';
import 'package:practice_app/screens/plant&guide.dart';
import 'package:practice_app/screens/blog_page.dart';
import 'package:practice_app/screens/myorder.dart';
import 'package:practice_app/screens/myAdresses.dart';
import 'package:practice_app/screens/Categories.dart';
import 'package:practice_app/screens/credits.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';

class DrawerClass extends StatefulWidget {
  static const routeName = '/drawerscreen';

  const DrawerClass({Key? key}) : super(key: key);
  //drawer({Key key}) : super(key: key);
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  abc(value) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      switch (value) {
        case 'notificationscreen':
          return Notifications();

        case 'plantguide':
          return PlantGuideScreen();

        case 'blogscreen':
          return Blog();

        case 'myorder':
          return MyOrder();

        case 'myaddresses':
          return const MyAdress();

        case 'categoriesscreen':
          return Categories();

        case 'creditscreen':
          return const Credits();

        case 'settingscreen':
          return SettingsPage();

        default:
          return MyBottomNavigation();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    String arrayObjsText =
        '{"tags": [{"name": "Notification", "id": 1,"img" : "assets/icons/notifications.png","routeName" : "notificationscreen"}, '
        '{"name": "Plant Guide", "id": 2 ,"img" : "assets/icons/plant&guideIcon.png","routeName" : "plantguide"},'
        '{"name": "Latest Blogs", "id": 3 ,"img" : "assets/icons/blogs.png","routeName" : "blogscreen"}, '
        '{"name": "Orders", "id": 4,"img" : "assets/icons/order.png","routeName" : "myorder"}, '
        '{"name": "Address", "id": 5 ,"img" : "assets/icons/addressIcon.png","routeName" : "myaddresses"}, '
        '{"name": "Categories", "id": 6 ,"img" : "assets/icons/category.png","routeName" : "categoriesscreen"}, '
        '{"name": "Credits", "id": 7,"img" : "assets/icons/credits.png","routeName" : "creditscreen"},'
        '{"name": "Settings", "id": 8,"img" : "assets/icons/settingIcon.png","routeName" : "settingscreen"}]}';

    var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
    List<Tag> tagObjs =
        tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    print(tagObjs);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  // border: Border.all(color: Colors.black),
                ),
                // color: Colors.amber,
                //padding: EdgeInsets.only(left:40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 30, 15),
                      child: Column(
                        children:const[
                          SizedBox(
                            height: 80,
                            width: 80,
                            child:  Image(
                              image: AssetImage("assets/images/pheobe.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const[
                           Text(
                            "Pheobe Buffay",
                            style:  TextStyle(
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 20,
                              color: primary_text_one,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                           Text(
                            "pheobe@gmail.com",
                            style: TextStyle(color: primary_text_one),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      iconSize: 35,
                      color: primary_text_one,
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                            content:  Text("Option Unavailable right now.."),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 5,
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tagObjs.length,
                  itemBuilder: (context, index) {
                    return tagObjs[index] != null
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                splashColor: Colors.greenAccent,
                                child: ListTile(
                                  onTap: () {
                                    abc(tagObjs[index].routeName);
                                  },
                                  leading: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: primary_background_six,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Image(
                                          image: AssetImage(
                                            tagObjs[index].img.toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      tagObjs[index].name.toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Container(
                                    child: IconButton(
                                      onPressed: () {
                                        abc(tagObjs[index].routeName);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                      iconSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Material(
                  color: Colors.white.withOpacity(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primary_icon_one),
                    child: InkWell(
                      splashColor: Colors.greenAccent,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthScreen()));
                        },
                        leading: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            iconSize: 35,
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: const Text(
                            "Logout",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: primary_text_one,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
