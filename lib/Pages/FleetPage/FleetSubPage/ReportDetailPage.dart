import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportDetailPage extends StatefulWidget {
  @override
  _ReportDetailPageState createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Rapor Detayı',
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
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
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
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  
                ),
                primaryYAxis: CategoryAxis(),
                series: <StackedAreaSeries<PieChartModel, String>>[
                  StackedAreaSeries(
                    dataSource: AppData.piaChartDataList, 
                    xValueMapper: (PieChartModel data, index) => data.x, 
                    yValueMapper: (PieChartModel data, index) => data.y,
                  ),
                  StackedAreaSeries(
                    dataSource: AppData.piaChartDataList2, 
                    xValueMapper: (PieChartModel data, index) => data.x, 
                    yValueMapper: (PieChartModel data, index) => data.y,
                  ),
                  StackedAreaSeries(
                    dataSource: AppData.piaChartDataList2, 
                    xValueMapper: (PieChartModel data, index) => data.x, 
                    yValueMapper: (PieChartModel data, index) => data.y,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
}
