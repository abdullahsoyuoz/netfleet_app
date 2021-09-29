import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Pages/FleetPage/FleetSubPage/ReportDetailPage.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';

class CareReportPage extends StatefulWidget {
  @override
  _CareReportPageState createState() => _CareReportPageState();
}

class _CareReportPageState extends State<CareReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Bakım Raporu',
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
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              itemCount: AppData.vehicleList.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 5,
              ),
              itemBuilder: (context, index) {
                var item = AppData.vehicleList[index];
                return buildVehicleItem(item);
              },
            ),
            Align(
                alignment: Alignment.center,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (context) => ReportDetailPage(),));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.amber,
                    child: Text(
                      'Rapor Detay',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )))
          ],
        ),
      ),
    );
  }

  Widget buildVehicleItem(VehicleModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                item.isChecked = !item.isChecked;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: item.isChecked
                    ? Icon(
                        FontAwesomeIcons.check,
                        size: 15,
                        color: Colors.white,
                      )
                    : SizedBox(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              item.plate,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${item.brand} ${item.model}',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
