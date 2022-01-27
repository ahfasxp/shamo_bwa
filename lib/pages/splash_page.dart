import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_bwa/providers/auth_provider.dart';
import 'package:shamo_bwa/providers/preferences_provider.dart';
import 'package:shamo_bwa/providers/product_provider.dart';
import 'package:shamo_bwa/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    PreferencesProvider preferencesProvider =
        Provider.of<PreferencesProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    if (await authProvider.isLogin(token: preferencesProvider.userToken)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/sign-in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image_splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
