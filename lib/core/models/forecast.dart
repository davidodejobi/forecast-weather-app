import 'main_temp.dart';
import 'weather.dart';

class Forecast {
  int? dt;
  Main? main;
  List<Weather>? weather;
  int? visibility;
  num? pop;
  String? dtTxt;

  Forecast(
      {this.dt,
      this.main,
      this.weather,
      this.visibility,
      this.pop,
      this.dtTxt});

  Forecast.fromJson(Map<String, dynamic> json) {
    dt = json["dt"];
    main = json["main"] == null ? null : Main.fromJson(json["main"]);
    weather = json["weather"] == null
        ? null
        : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList();
    visibility = json["visibility"];
    pop = json["pop"];
    dtTxt = json["dt_txt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dt"] = dt;
    if (main != null) {
      data["main"] = main?.toJson();
    }
    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    data["visibility"] = visibility;
    data["pop"] = pop;
    data["dt_txt"] = dtTxt;
    return data;
  }
}
