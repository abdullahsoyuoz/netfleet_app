import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netfleet_app/Utility/AppData.dart';
import 'package:netfleet_app/Utility/Colors.dart';
import 'package:netfleet_app/Utility/util.dart';

class NewVehiclePage extends StatefulWidget {
  @override
  _NewVehiclePageState createState() => _NewVehiclePageState();
}

class _NewVehiclePageState extends State<NewVehiclePage> {
  TextEditingController _brandController;
  TextEditingController _modelController;
  TextEditingController _plateController;

  @override
  void initState() {
    super.initState();
    _brandController = new TextEditingController();
    _modelController = new TextEditingController();
    _plateController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _plateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Araç Tanımla',
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
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          children: [
            TextField(
              controller: _brandController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  labelStyle: TextStyle(color: AppColors.mainColor),
                  labelText: 'Marka'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: _modelController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    labelStyle: TextStyle(color: AppColors.mainColor),
                    labelText: 'Model'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: _plateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    labelStyle: TextStyle(color: AppColors.mainColor),
                    labelText: 'Plaka'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: () {
                  AppData.vehicleList.add(VehicleModel(
                      AppData.vehicleList.length + 1,
                      _brandController.text,
                      _modelController.text,
                      _plateController.text,
                      false));
                  Navigator.pop(context);
                },
                color: Colors.amber,
                child: Text(
                  'Tanımla',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
