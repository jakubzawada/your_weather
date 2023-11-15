class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.icon,
    required this.isDay,
    required this.text,
    required this.windkKph,
    required this.pressure,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.tempF,
    required this.visKm,
  });

  final double temperature;
  final String city;
  final String icon;
  final int isDay;
  final String text;
  final double windkKph;
  final double pressure;
  final double precipMm;
  final int humidity;
  final int cloud;
  final double tempF;
  final double visKm;
}
