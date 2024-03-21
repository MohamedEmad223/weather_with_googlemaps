class Weather {
  final String district;
  final String region;
  final String country;
  final String timezone;
  final String time;

  final double temp;
  final String condition;
  final double windSpeed;

  Weather({
    required this.district,
    required this.region,
    required this.country,
    required this.timezone,
    required this.time,
    required this.temp,
    required this.condition,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      district: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      timezone: json['location']['tz_id'],
      time: json['location']['localtime'],
      temp: double.tryParse(json['current']['temp_c'].toString()) ?? 0.0,
      condition: json['current']['condition']['text'],
      windSpeed: double.tryParse(json['current']['wind_kph'].toString()) ?? 0.0,
    );
  }
}