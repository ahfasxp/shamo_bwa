import 'package:flutter/material.dart';
import 'package:shamo_bwa/pages/cart_page.dart';
import 'package:shamo_bwa/pages/checkout_page.dart';
import 'package:shamo_bwa/pages/checkout_success_page.dart';
import 'package:shamo_bwa/pages/detail_chat_page.dart';
import 'package:shamo_bwa/pages/edit_profile_page.dart';
import 'package:shamo_bwa/pages/home/main_page.dart';
import 'package:shamo_bwa/pages/product_page.dart';
import 'package:shamo_bwa/pages/sign_in_page.dart';
import 'package:shamo_bwa/pages/sign_up_page.dart';
import 'package:shamo_bwa/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
