import 'package:intl/intl.dart';

String timeConverter(int time) {
  var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  var formatter = DateFormat.j();
  var formatted = formatter.format(date);
  return formatted;
}

//check weather condition and assign a icon
String getWeatherIcon(int condition) {
  if (condition < 300) {
    return 'tstorm';
  } else if (condition >= 300 && condition < 400) {
    return 'chancesleet';
  } else if (condition >= 400 && condition < 600) {
    return 'rain';
  } else if (condition >= 600 && condition <= 700) {
    return 'snow';
  } else if (['800', '801'].contains(condition.toString())) {
    return 'sunny';
  } else if (['803', '804'].contains(condition.toString())) {
    return 'cloudy';
  } else {
    return 'partlycloudy';
  }
}

List<dynamic> dataChunker(List items) {
  var chunkOfTime = [];
  int chunkSize = 8;
  for (var i = 0; i < items.length; i += chunkSize) {
    chunkOfTime.add(items.sublist(
        i, i + chunkSize > items.length ? items.length : i + chunkSize));
  }

  return chunkOfTime;
}
