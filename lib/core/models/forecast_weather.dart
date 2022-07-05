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

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
    country = json["country"];
    population = json["population"];
    timezone = json["timezone"];
    sunrise = json["sunrise"];
    sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    if (coord != null) {
      data["coord"] = coord?.toJson();
    }
    data["country"] = country;
    data["population"] = population;
    data["timezone"] = timezone;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}

class Coord {
  num? lat;
  num? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lon = json["lon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lon"] = lon;
    return data;
  }
}

class Forecast {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  num? pop;
  Sys? sys;
  String? dtTxt;

  Forecast(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt});

  Forecast.fromJson(Map<String, dynamic> json) {
    dt = json["dt"];
    main = json["main"] == null ? null : Main.fromJson(json["main"]);
    weather = json["weather"] == null
        ? null
        : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList();
    clouds = json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]);
    wind = json["wind"] == null ? null : Wind.fromJson(json["wind"]);
    visibility = json["visibility"];
    pop = json["pop"];
    sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
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
    if (clouds != null) {
      data["clouds"] = clouds?.toJson();
    }
    if (wind != null) {
      data["wind"] = wind?.toJson();
    }
    data["visibility"] = visibility;
    data["pop"] = pop;
    if (sys != null) {
      data["sys"] = sys?.toJson();
    }
    data["dt_txt"] = dtTxt;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json["pod"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["pod"] = pod;
    return data;
  }
}

class Wind {
  num? speed;
  int? deg;
  num? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json["speed"];
    deg = json["deg"];
    gust = json["gust"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["speed"] = speed;
    data["deg"] = deg;
    data["gust"] = gust;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json["all"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = all;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    main = json["main"];
    description = json["description"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}

class Main {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  num? tempKf;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json["temp"];
    feelsLike = json["feels_like"];
    tempMin = json["temp_min"];
    tempMax = json["temp_max"];
    pressure = json["pressure"];
    seaLevel = json["sea_level"];
    grndLevel = json["grnd_level"];
    humidity = json["humidity"];
    tempKf = json["temp_kf"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["sea_level"] = seaLevel;
    data["grnd_level"] = grndLevel;
    data["humidity"] = humidity;
    data["temp_kf"] = tempKf;
    return data;
  }
}
