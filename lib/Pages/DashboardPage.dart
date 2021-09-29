import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetPageViewBuilder.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool hasModulListView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'NetFleet',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              SlideDrawer.of(context).toggle();
            },
            child: Icon(FontAwesomeIcons.bars)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 10,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Özet',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: getSize(context) * 0.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return buildPieChart(index);
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Modüller',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hasModulListView = !hasModulListView;
                      });
                    },
                    splashColor: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Text(
                              hasModulListView ? 'Liste' : 'Grid',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            hasModulListView
                                ? FontAwesomeIcons.thList
                                : FontAwesomeIcons.thLarge,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: hasModulListView
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          var item = AppData.moduller[index];
                          return buildModulesListViewItem(item);
                        },
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.grey.shade400,
                            ),
                        itemCount: AppData.moduller.length)
                    : GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        children: AppData.moduller.map((item) {
                          return buildModulesGridViewItem(item);
                        }).toList(),
                      ))
          ],
        ),
      ),
    );
  }

  Widget buildModulesListViewItem(ModulModel item) {
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
                  size: 20,
                  color: AppColors.mainColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    item.title,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
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

  Widget buildModulesGridViewItem(ModulModel item) {
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

  Widget buildPieChart(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${index + 1}. pie',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: getSize(context) * 0.4,
          width: getSize(context) * 0.6,
          margin: EdgeInsets.only(right: 20, top: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SfCircularChart(
                backgroundColor: AppColors.mainColor,
                legend: Legend(
                    isVisible: true,
                    alignment: ChartAlignment.center,
                    position: LegendPosition.right,
                    textStyle: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                palette: [
                  Colors.green.shade400,
                  Colors.blueAccent,
                  Colors.white,
                ],
                series: <PieSeries<PieChartModel, String>>[
                  PieSeries<PieChartModel, String>(
                      dataSource: AppData.piaChartDataList,
                      xValueMapper: (PieChartModel data, _) => data.x,
                      yValueMapper: (PieChartModel data, _) => data.y,
                      dataLabelMapper: (PieChartModel data, _) => data.y.toString(),
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)
                      ))
                ]),
          ),
        ),
      ],
    );
  }

  void routePage(ModulModel modul) {
    if (modul.id == 0) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => FleetPageViewBuilder(modul),
          ));
    }
  }
}
