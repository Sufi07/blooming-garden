// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practice_app/providers/address_provider.dart';
import 'package:practice_app/providers/auth.dart';
import 'package:practice_app/providers/cart_provider.dart';
import 'package:practice_app/providers/orderProvider.dart';
import 'package:practice_app/providers/products_provider.dart';
import 'package:practice_app/screens/Categories.dart';
import 'package:practice_app/screens/accounts.dart';
import 'package:practice_app/screens/authScreen.dart';
import 'package:practice_app/screens/blog_detail.dart';
import 'package:practice_app/screens/blog_page.dart';
import 'package:practice_app/screens/checkout.dart';
import 'package:practice_app/screens/favorites_products.dart';
import 'package:practice_app/screens/filter.dart';
import 'package:practice_app/screens/filteredProducts.dart';
import 'package:practice_app/screens/forgotPassword.dart';
import 'package:practice_app/screens/home_page.dart';
import 'package:practice_app/screens/invoice.dart';
import 'package:practice_app/screens/myAdresses.dart';
import 'package:practice_app/screens/my_cart.dart';
import 'package:practice_app/screens/myorder.dart';
import 'package:practice_app/screens/newBillingAddress.dart';
import 'package:practice_app/screens/newShippingAdress.dart';
import 'package:practice_app/screens/notifications.dart';
import 'package:practice_app/screens/orderDetail.dart';
import 'package:practice_app/screens/payment.dart';
import 'package:practice_app/screens/plant&guide.dart';
import 'package:practice_app/screens/plantGuideDetails.dart';
import 'package:practice_app/screens/productDetail.dart';
import 'package:practice_app/screens/product_listing.dart';
import 'package:practice_app/screens/quickBuy.dart';
import 'package:practice_app/screens/settings.dart';
import 'package:practice_app/screens/splashscreen.dart';
import 'package:practice_app/screens/updateCartScreen.dart';
import 'package:practice_app/screens/walkthrough.dart';
import 'package:practice_app/widgets/bottomNavBar.dart';
import 'package:practice_app/widgets/product_description.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/language_constant.dart';
import 'localization/localization.dart';
import 'screens/credits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddressProvider(),
        )
      ],
      child: _locale == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue,
                ),
              ),
            )
          : MaterialApp(
              locale: _locale,
              supportedLocales: const [
                Locale("en", "US"),
                Locale("ur", "PK"),
                Locale("ar", "SA"),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              // builder: (context, widget) => ResponsiveWrapper.builder(
              //   BouncingScrollWrapper.builder(context, Container()),
              //   maxWidth: 1200,
              //   minWidth: 450,
              //   defaultScale: true,
              //   breakpoints: const [
              //     ResponsiveBreakpoint.resize(450, name: MOBILE),
              //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
              //     ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              //     ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              //     ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              //   ],
              //   background: Container(
              //     color: const Color(0xFFF5F5F5),
              //   ),
              // ),
              debugShowCheckedModeBanner: false,
              home: Splashscreen(),
              // home: Homepage(),
              routes: {
                MyBottomNavigation.routeName: (ctx) => MyBottomNavigation(),
                AuthScreen.routeName: (ctx) => AuthScreen(),
                ProductDetail.routeName: (ctx) => ProductDetail(),
                // ignore: equal_keys_in_map
                Filter.routeName: (ctx) => Filter(),
                BlogDetail.routeName: (ctx) => BlogDetail(),
                MyOrder.routeName: (ctx) => MyOrder(),
                // ignore: equal_keys_in_map
                Paymentt.routeName: (ctx) => Paymentt(),
                ProductListing.routeName: (ctx) => ProductListing(),
                ProductDescription.routeName: (ctx) =>
                    const ProductDescription(),
                MyCart.routeName: (ctx) => MyCart(),
                Checkout.routeName: (ctx) => Checkout(),
                Blog.routeName: (ctx) => Blog(),
                Invoice.routeName: (ctx) => Invoice(),
                Homepage.routeName: (ctx) => Homepage(),
                MyAdress.routeName: (ctx) => const MyAdress(),
                Credits.routeName: (ctx) => const Credits(),
                WalkThrough.routeName: (ctx) => const WalkThrough(),
                Categories.routeName: (ctx) => Categories(),
                // TakePictureScreen.routeName: (ctx) => TakePictureScreen(),
                FilterProducts.routeName: (ctx) => const FilterProducts(),
                FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
                UpdateCartScreen.routeName: (ctx) => UpdateCartScreen(),
                Forgetpass.routeName: (ctx) => Forgetpass(),
                MyAccount.routeName: (ctx) => MyAccount(),
                Notifications.routeName: (ctx) => Notifications(),
                QuickBuy.routeName: (ctx) => QuickBuy(),
                AddShippingaddress.routeName: (ctx) => AddShippingaddress(),
                AddBillingAddress.routeName: (ctx) => AddBillingAddress(),
                Plantguidedetails.routeName: (ctx) => Plantguidedetails(),
                PlantGuideScreen.routeName: (ctx) => PlantGuideScreen(),
                OrderDetail.routeName: (ctx) => OrderDetail(),
                SettingsPage.routeName: (ctx) => SettingsPage(),
              },
            ),
    );
  }
}
