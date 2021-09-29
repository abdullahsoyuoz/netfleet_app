import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetSubPage/VehicleListPage.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';

class FleetDefinitionPage extends StatefulWidget {
  @override
  _FleetDefinitionPageState createState() => _FleetDefinitionPageState();
}

class _FleetDefinitionPageState extends State<FleetDefinitionPage> {
  bool hasDefinitionsListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: getSize(context),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: FlatButton(
                padding: EdgeInsets.zero,
                height: 30,
                splashColor: Colors.amber,
                onPressed: () {
                  setState(() {
                    hasDefinitionsListView = !hasDefinitionsListView;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Text(
                        hasDefinitionsListView ? 'Liste' : 'Grid',
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      hasDefinitionsListView
                          ? FontAwesomeIcons.thList
                          : FontAwesomeIcons.thLarge,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: hasDefinitionsListView
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        var item = AppData.tanimlamalar[index];
                        return buildDefinitionListViewItem(item);
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.grey.shade400,
                          ),
                      itemCount: AppData.tanimlamalar.length)
                  : GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      children: AppData.tanimlamalar.map((item) {
                        return buildDefinitionGridViewItem(item);
                      }).toList(),
                    ))
        ],
      ),
    ));
  }

  Widget buildDefinitionListViewItem(DefinitionModel item) {
    return InkWell(
      onTap: () {
        routePage(item);
      },
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 5,
          top: 5,
          left: 5,
          right: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  item.iconData,
                  size: 30,
                  color: AppColors.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    item.title,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Icon(
              FontAwesomeIcons.chevronCircleRight,
              size: 20,
              color: Colors.grey.shade300,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDefinitionGridViewItem(DefinitionModel item) {
    return FlatButton(
      splashColor: Colors.white.withOpacity(.2),
      color: AppColors.mainColor,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () {
        routePage(item);
      },
      child: Container(
          child: Stack(
        children: [
          Positioned.fill(
            right: -75,
            child: Icon(
              item.iconData,
              color: Colors.white.withOpacity(0.1),
              size: 150,
            ),
          ),
          Center(
              child: Text(item.title,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16))),
        ],
      )),
    );
  }

  void routePage(DefinitionModel modul) {
    if (modul.id == 0) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) => VehicleListPage(),
      ));
    }
  }
}
