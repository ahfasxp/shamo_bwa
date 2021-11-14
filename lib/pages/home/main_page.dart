import 'package:flutter/material.dart';
import 'package:shamo_bwa/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: Image.asset(
          'assets/images/icon_cart.png',
          width: 20,
          height: 22,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_home.png',
                    width: 21,
                    height: 20,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_chat.png',
                    width: 20,
                    height: 18,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_wishlist.png',
                    width: 20,
                    height: 18,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_profile.png',
                    width: 18,
                    height: 20,
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Text(
          'Main Page',
        ),
      ),
      floatingActionButton: cardButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
    );
  }
}
