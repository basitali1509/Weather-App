import 'dart:convert';

class WeatherModelClass {
  WeatherModelClass({
    required this.list,
  });

  final List<ListModel> list;

  factory WeatherModelClass.fromJson(Map<String, dynamic> json) {
    final list = List<ListModel>.from((json['list'] as List<dynamic>)
        .map((e) => ListModel.fromJson(e as Map<String, dynamic>)));
    return WeatherModelClass(list: list);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list'] = list.map((e) => e.toJson()).toList();
    return data;
  }
}

class ListModel {
  ListModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final SysModel sys;
  final String dtTxt;

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        dt: json['dt'] as int,
        main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>)
            .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
        wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
        visibility: json['visibility'] as int,
        pop: (json['pop'] as num).toDouble(),
        sys: SysModel.fromJson(json['sys'] as Map<String, dynamic>),
        dtTxt: json['dt_txt'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dt': dt,
        'main': main.toJson(),
        'weather': weather.map((e) => e.toJson()).toList(),
        'clouds': clouds.toJson(),
        'wind': wind.toJson(),
        'visibility': visibility,
        'pop': pop,
        'sys': sys.toJson(),
        'dt_txt': dtTxt,
      };
}

class MainModel {
  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        temp: (json['temp'] as num).toDouble(),
        feelsLike: (json['feels_like'] as num).toDouble(),
        tempMin: (json['temp_min'] as num).toDouble(),
        tempMax: (json['temp_max'] as num).toDouble(),
        pressure: json['pressure'] as int,
        seaLevel: json['sea_level'] as int,
        grndLevel: json['grnd_level'] as int,
        humidity: json['humidity'] as int,
        tempKf: (json['temp_kf'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'humidity': humidity,
        'temp_kf': tempKf,
      };
}

class WeatherModel {
  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['id'] as int,
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class CloudsModel {
  CloudsModel({
    required this.all,
  });

  final int all;

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json['all'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'all': all,
      };
}

class WindModel {
  WindModel({
    required this.speed,
    required this.deg,
  });

  final double speed;
  final int deg;

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: (json['speed'] as num).toDouble(),
        deg: json['deg'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'speed': speed,
        'deg': deg,
      };
}

class SysModel {
  SysModel({
    required this.pod,
  });

  final String pod;

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        pod: json['pod'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pod': pod,
      };
}
