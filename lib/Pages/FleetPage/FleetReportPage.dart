import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetSubPage/CareReportPage.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FleetReportPage extends StatefulWidget {
  @override
  _FleetReportPageState createState() => _FleetReportPageState();
}

class _FleetReportPageState extends State<FleetReportPage> {
  bool hasSubModulListView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: getSize(context),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Özet',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20,
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
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
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
                    hasSubModulListView = !hasSubModulListView;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Text(
                        hasSubModulListView ? 'Liste' : 'Grid',
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      hasSubModulListView
                          ? FontAwesomeIcons.thList
                          : FontAwesomeIcons.thLarge,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
          hasSubModulListView
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    var item = AppData.subModuller[index];
                    return buildSubModulListViewItem(item);
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: AppColors.mainColor,
                      ),
                  itemCount: AppData.subModuller.length)
              : GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: AppData.subModuller.map((item) {
                    return buildSubModulesGridViewItem(item);
                  }).toList(),
                ),
        ],
      ),
    ));
  }

  Widget buildSubModulListViewItem(SubModulModel item) {
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
                  padding: const EdgeInsets.only(left: 16.0),
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

  Widget buildSubModulesGridViewItem(SubModulModel item) {
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
                      dataLabelMapper: (PieChartModel data, _) =>
                          data.x.toString(),
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                      ))
                ]),
          ),
        ),
      ],
    );
  }

  void routePage(SubModulModel modul) {
    if (modul.id == 0) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) => CareReportPage(),
      ));
    }
  }
}
