import 'city.dart';
import 'forecast.dart';

class ForecastWeather {
  String? cod;
  int? message;
  int? cnt;
  List<dynamic>? list;
  City? city;

  ForecastWeather({this.cod, this.message, this.cnt, this.list, this.city});

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    cod = json["cod"];
    message = json["message"];
    cnt = json["cnt"];
    list = json["list"] == null
        ? null
        : (json["list"]).map((e) => Forecast.fromJson(e)).toList();
    city = json["city"] == null ? null : City.fromJson(json["city"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cod"] = cod;
    data["message"] = message;
    data["cnt"] = cnt;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    if (city != null) {
      data["city"] = city?.toJson();
    }
    return data;
  }
}
