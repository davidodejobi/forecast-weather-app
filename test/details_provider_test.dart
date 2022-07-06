import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/details/provider/details_provider.dart';

void main() {
  DetailProvider? detailsProvider;
  setUp(() {
    detailsProvider = DetailProvider();
  });

//this test is not pass now though but if tested on a dartpad or while running on the app it works
  test('calculate and return the days in a week starting from today', () {
    List daysOfTheWeek = [
      'Friday',
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
    ];
    List weekDaysFromToday = detailsProvider?.getWeek('Friday');
    expect(
      weekDaysFromToday,
      daysOfTheWeek,
      reason:
          'because it loops through till it finds a match of today as a string then starts add it to the list',
    );
  });
}
