import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netfleet_app/Pages/DashboardPage.dart';
import 'package:netfleet_app/Pages/SupportPage.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() {
  Key _appKey = UniqueKey();
  runApp(MaterialApp(
    key: _appKey,
    debugShowCheckedModeBanner: false,
    home: AppStarter(),
  ));
}

class AppStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
        backgroundColor: AppColors.mainColor,
        headDrawer: Image.network(headerUrl),
        alignment: SlideDrawerAlignment.start,
        offsetFromRight: 200,
        items: [
          MenuItem('Home', icon: FontAwesomeIcons.home, onTap: () {}),
          MenuItem('Destek', icon: FontAwesomeIcons.headset, onTap: () {
            //TODO: SLİDER_DRAWER PUSHNAVIGATE AFTER NOT WORKING FIX ;)
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => SupportPage(),
                ));
          }),
        ],
        child: DashboardPage());
  }
}
