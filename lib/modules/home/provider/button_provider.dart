import 'package:flutter/cupertino.dart';

import '../../../core/services/location_service.dart';
import '../../../locator.dart';

LocationService _locationService = getIt<LocationService>();

class ButtonProvider with ChangeNotifier {
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  int _selectedDay = 0;
  String _selectedDayName = 'Today';

  String get selectedDayName => _selectedDayName;
  int get selectedDay => _selectedDay;

  switcher(int index) {
    if (index == 0) {
      _selectedDay = 0;
      _selectedDayName = 'Today';
      _locationService.getCurrentPosition(_selectedDay);
      notifyListeners();
      if (button1 == false) {
        button1 = true;
        button2 = false;
        button3 = false;
        notifyListeners();
      }
    } else if (index == 1) {
      _selectedDay = 1;
      _selectedDayName = 'Tomorrow';
      _locationService.getCurrentPosition(_selectedDay);
      notifyListeners();
      if (button2 == false) {
        button2 = true;
        button1 = false;
        button3 = false;
        notifyListeners();
      }
    } else if (index == 2) {
      if (button3 == false) {
        button3 = true;
        button2 = false;
        button1 = false;
        notifyListeners();
      }
    }
  }
}
