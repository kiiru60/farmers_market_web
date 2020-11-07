import 'package:flutter/widgets.dart';

class UserSettings {
  String fullName;
  String dateOfBirth;
  bool notifySales;
  bool notifyArrivals;
  bool notifyDelivery;

  UserSettings(
      {@required this.fullName,
      @required this.dateOfBirth,
      @required this.notifySales,
      @required this.notifyArrivals,
      @required this.notifyDelivery});
}
