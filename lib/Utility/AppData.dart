import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppData {
  static List<PieChartModel> piaChartDataList = [
    PieChartModel('x', 15),
    PieChartModel('y', 24),
    PieChartModel('z', 18),
  ];

  static List<PieChartModel> piaChartDataList2 = [
    PieChartModel('x', 24),
    PieChartModel('y', 56),
    PieChartModel('z', 98),
  ];

  static List<PieChartModel> piaChartDataList3 = [
    PieChartModel('x', 45),
    PieChartModel('y', 89),
    PieChartModel('z', 490),
  ];

  static List<ModulModel> moduller = [
    ModulModel(0, 'Fleet', FontAwesomeIcons.car),
    ModulModel(1, 'Kids', FontAwesomeIcons.child),
    ModulModel(2, 'HOS', FontAwesomeIcons.home),
    ModulModel(3, 'MyDrive', FontAwesomeIcons.car),
    ModulModel(4, 'Alert', FontAwesomeIcons.solidBell),
    ModulModel(5, 'Fuel', FontAwesomeIcons.gasPump),
  ];

  static List<SubModulModel> subModuller = [
    SubModulModel(0, 'Bakım', FontAwesomeIcons.handHoldingMedical),
    SubModulModel(1, 'Sigorta', FontAwesomeIcons.handHoldingUsd),
    SubModulModel(2, 'Muayene', FontAwesomeIcons.tools),
    SubModulModel(3, 'Giderler', FontAwesomeIcons.moneyBillWaveAlt),
    SubModulModel(4, 'Kaza', FontAwesomeIcons.carCrash),
    SubModulModel(5, 'Ceza', FontAwesomeIcons.times),
    SubModulModel(6, 'Sertifika', FontAwesomeIcons.certificate),
  ];

  static List<DefinitionModel> tanimlamalar = [
    DefinitionModel(0, 'Araçlar', FontAwesomeIcons.car),
    DefinitionModel(1, 'Kullanıcılar', FontAwesomeIcons.solidUser),
    DefinitionModel(2, 'Bölge Tanımları', FontAwesomeIcons.solidMap),
    DefinitionModel(3, 'Cihazlar', FontAwesomeIcons.mobile),
    DefinitionModel(4, 'Alarmlar', FontAwesomeIcons.solidBell),
  ];

  static List<VehicleModel> vehicleList = [
    VehicleModel(0, 'Audi', 'A3', '34 RF 2344', false),
    VehicleModel(1, 'Volvo', 'S60', '54 YZ 9999', false),
    VehicleModel(2, 'Mercedes', 'A45', '42 BT 810', false),
    VehicleModel(3, 'Alfa Romeo', 'Giulietta', '35 TE 4323', false),
  ];

  static List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.thList), label: 'Menu'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidMap), label: 'Harita'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidFlag), label: 'Rapor'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.clipboardList), label: 'Tanımlama'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.usersCog), label: 'Ayarlar'),
  ];
}

String headerUrl =
    'https://media.istockphoto.com/photos/new-generic-cars-picture-id1224039863?b=1&k=6&m=1224039863&s=170667a&w=0&h=k4yKIZUXdELUn1yVslwHyY9I3cuapRzqECTkMFWmZxM=';

class PieChartModel {
  String x;
  double y;
  PieChartModel(this.x, this.y);
}

class ModulModel {
  int id;
  String title;
  IconData iconData;
  ModulModel(this.id, this.title, this.iconData);
}

class SubModulModel {
  int id;
  String title;
  IconData iconData;
  SubModulModel(this.id, this.title, this.iconData);
}

class DefinitionModel {
  int id;
  String title;
  IconData iconData;
  DefinitionModel(this.id, this.title, this.iconData);
}

class VehicleModel {
  int id;
  String brand;
  String model;
  String plate;
  bool isChecked;
  VehicleModel(this.id, this.brand, this.model, this.plate, this.isChecked);
}
