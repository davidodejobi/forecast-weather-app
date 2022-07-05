import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/home/provider/home_provider.dart';

void main() {
  HomeProvider? homeProvider;
  setUp(() {
    homeProvider = HomeProvider();
  });

  test('breaks the list of forecast in to 8 in a list for each day', () {
    List<int> list = List.generate(40, (i) => i);
    List chunkedList = homeProvider!.dataChunker(list);
    expect(chunkedList.length, 5);
    expect(chunkedList[0].length, 8);
    expect(chunkedList[1].length, 8);
    expect(chunkedList[2].length, 8);
    expect(chunkedList[3].length, 8);
    expect(chunkedList[4].length, 8);
  });

  //test for time converter
  test('converts time to a readable format', () {
    int time = 159840000;
    String timeConverted = homeProvider!.timeConverter(time);
    expect(timeConverted, '1 AM');
  });
}
