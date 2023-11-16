class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.icon,
    required this.isDay,
    required this.text,
    required this.windKph,
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
  final double windKph;
  final double pressure;
  final double precipMm;
  final int humidity;
  final int cloud;
  final double tempF;
  final double visKm;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        icon = json['current']['condition']['icon'],
        isDay = json['current']['is_day'],
        text = json['current']['condition']['text'],
        windKph = json['current']['wind_kph'] + 0.0,
        pressure = json['current']['pressure_in'] + 0.0,
        precipMm = json['current']['precip_mm'] + 0.0,
        humidity = json['current']['humidity'],
        cloud = json['current']['cloud'],
        tempF = json['current']['temp_f'] + 0.0,
        visKm = json['current']['vis_km'] + 0.0;
}
