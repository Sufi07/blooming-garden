import 'package:practice_app/localization/language_constant.dart';
import 'package:practice_app/screens/authScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void showRelevant() async {
    await Future.delayed(const Duration(seconds: 2));
    print('hee');
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  @override
  void initState() {
    showRelevant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: const Image(
              image:  AssetImage(
                "assets/images/splash.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    getTranslated(context, 'splash-screen-title'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 140.0,
                      fontFamily: 'Morganite Bold',
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    getTranslated(context, 'splash-screen-description'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: 2.5,
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: 'Morganite Light',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
