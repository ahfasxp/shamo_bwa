import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shamo_bwa/pages/cart_page.dart';
import 'package:shamo_bwa/pages/checkout_page.dart';
import 'package:shamo_bwa/pages/checkout_success_page.dart';
import 'package:shamo_bwa/pages/edit_profile_page.dart';
import 'package:shamo_bwa/pages/home/main_page.dart';
import 'package:shamo_bwa/pages/sign_in_page.dart';
import 'package:shamo_bwa/pages/sign_up_page.dart';
import 'package:shamo_bwa/pages/splash_page.dart';
import 'package:shamo_bwa/preferences/preferences_helper.dart';
import 'package:shamo_bwa/providers/auth_provider.dart';
import 'package:shamo_bwa/providers/cart_provider.dart';
import 'package:shamo_bwa/providers/page_provider.dart';
import 'package:shamo_bwa/providers/preferences_provider.dart';
import 'package:shamo_bwa/providers/product_provider.dart';
import 'package:shamo_bwa/providers/transaction_provider.dart';
import 'package:shamo_bwa/providers/wishlist_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
