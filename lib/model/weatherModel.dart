import 'dart:convert';

WeatherClass weatherClassFromJson(String str) => WeatherClass.fromJson(json.decode(str));

String weatherClassToJson(WeatherClass data) => json.encode(data.toJson());

class WeatherClass {
  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  double elevation;
  Units currentUnits;
  Current current;
  Units hourlyUnits;
  Hourly hourly;

  WeatherClass({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
  });

  factory WeatherClass.fromJson(Map<String, dynamic> json) => WeatherClass(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    generationtimeMs: json["generationtime_ms"]?.toDouble(),
    utcOffsetSeconds: json["utc_offset_seconds"],
    timezone: json["timezone"],
    timezoneAbbreviation: json["timezone_abbreviation"],
    elevation: json["elevation"],
    currentUnits: Units.fromJson(json["current_units"]),
    current: Current.fromJson(json["current"]),
    hourlyUnits: Units.fromJson(json["hourly_units"]),
    hourly: Hourly.fromJson(json["hourly"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits.toJson(),
    "current": current.toJson(),
    "hourly_units": hourlyUnits.toJson(),
    "hourly": hourly.toJson(),
  };
}

class Current {
  String time;
  int interval;
  double temperature2M;
  double windSpeed10M;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.windSpeed10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"]?.toDouble(),
    windSpeed10M: json["wind_speed_10m"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
  };
}

class Units {
  String? time;
  String? interval;
  String? temperature2M;
  String? windSpeed10M;
  String? relativeHumidity2M;

  Units({
    required this.time,
    this.interval,
    required this.temperature2M,
    required this.windSpeed10M,
    this.relativeHumidity2M,
  });

  factory Units.fromJson(Map<String, dynamic> json) => Units(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
    windSpeed10M: json["wind_speed_10m"],
    relativeHumidity2M: json["relative_humidity_2m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
    "relative_humidity_2m": relativeHumidity2M,
  };
}

class Hourly {
  List<String> time;
  List<double> temperature2M;
  List<int> relativeHumidity2M;
  List<double> windSpeed10M;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.windSpeed10M,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: List<String>.from(json["time"].map((x) => x)),
    temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
    relativeHumidity2M: List<int>.from(json["relative_humidity_2m"].map((x) => x)),
    windSpeed10M: List<double>.from(json["wind_speed_10m"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": List<dynamic>.from(time.map((x) => x)),
    "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
    "relative_humidity_2m": List<dynamic>.from(relativeHumidity2M.map((x) => x)),
    "wind_speed_10m": List<dynamic>.from(windSpeed10M.map((x) => x)),
  };
}
