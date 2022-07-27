import 'package:flutter/material.dart';

class BlogDetail extends StatefulWidget {
  static const routeName = '/blog-detail-screen';
  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  String? title;
  String? date;
  String? parah;
  String? image;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs['title']!;
    image = routeArgs['imageAsset']!;
    date = routeArgs['date']!;
    parah = routeArgs['parah']!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
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
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(image!),
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 23),
                              child: Text(
                                date!,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Display', fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            title!,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            parah!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 100,
                                            softWrap: false,
                                            style: const TextStyle(
                                                fontFamily: 'PlayFairDisplay',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: const Text(
                                            'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero. Vivamus a viverra risus, et tempus tellus. Mauris semper, tortor et laoreet blandit, mauris mauris mollis quam, et faucibus magna libero non enim.',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 50,
                                            softWrap: false,
                                            style: const TextStyle(
                                                fontFamily:
                                                    'SF Pro Display Light',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: SizedBox(
                                          //height: MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: const Text(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 15, 15, 20),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                              // children: <Widget>[
                                              //   const Padding(
                                              //     padding:
                                              //         EdgeInsets.only(right: 8.0),
                                              //     child: Text("Share",
                                              //         style: TextStyle(
                                              //             color: Colors.black,
                                              //             fontFamily:
                                              //                 'PlayFairDisplay',
                                              //             fontSize: 18,
                                              //             fontWeight:
                                              //                 FontWeight.bold)),
                                              //   ),
                                              //   MaterialButton(
                                              //     onPressed: () {
                                              //       Scaffold.of(context)
                                              //           // ignore: deprecated_member_use
                                              //           .showSnackBar(
                                              //         const SnackBar(
                                              //           content: const Text(
                                              //               'Facebook Page is Under Development.'),
                                              //         ),
                                              //       );
                                              //     },
                                              //     color: Colors.black,
                                              //     height: 60,
                                              //     shape: const CircleBorder(),
                                              //   ),
                                              //   MaterialButton(
                                              //     onPressed: () {
                                              //       Scaffold.of(context)
                                              //           // ignore: deprecated_member_use
                                              //           .showSnackBar(
                                              //               const SnackBar(
                                              //         content: const Text(
                                              //             'Twitter Page is Under Development.'),
                                              //       ));
                                              //     },
                                              //     color: Colors.black,
                                              //     height: 60,
                                              //     shape: const CircleBorder(),
                                              //     child: const Image(
                                              //       image: const AssetImage(
                                              //           "assets/icons/twitter.png"),
                                              //       height: 20,
                                              //       color: Colors.white,
                                              //     ),
                                              //   ),
                                              // ],
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
