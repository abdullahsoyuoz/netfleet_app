import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetDefinitionPage.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetMapPage.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetMenuPage.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetReportPage.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetUserConfigPage.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';

class FleetPageViewBuilder extends StatefulWidget {
  ModulModel modul;
  FleetPageViewBuilder(this.modul);
  @override
  _FleetPageViewBuilderState createState() => _FleetPageViewBuilderState();
}

class _FleetPageViewBuilderState extends State<FleetPageViewBuilder> {
  PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      FleetMenuPage(),
      FleetMapPage(),
      FleetReportPage(),
      FleetDefinitionPage(),
      FleetUserConfigPage()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          getAppBarTitle(currentPageIndex),
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(FontAwesomeIcons.chevronLeft),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        items: AppData.navBarItems,
        backgroundColor: AppColors.mainColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.4),
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages[currentPageIndex],
      ),
    );
  }

  String getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Fleet';
        break;
      case 1:
        return 'Harita';
        break;
      case 2:
        return 'Rapor';
        break;
      case 3:
        return 'Tanımlamalar';
        break;
      case 4:
        return 'Kullanıcı İşlemleri';
        break;
      default:
        return '';
    }
  }
}
