import 'package:flutter_test/flutter_test.dart';
import 'package:your_weather/models/weather_model.dart';

void main() {
  test('should create WeatherModel with expected values', () {
    // 1
    final location = Location('name');
    final condition = Condition('text', 'icon');
    final current = Current(
      condition,
      10,
      11,
      12.0,
      13.0,
      14,
      15.0,
      16.00,
      17.0,
      18.0,
    );

    // 2
    final model = WeatherModel(location, current);

    // 3
    expect(model.location.name, 'name');
    expect(model.current.condition.text, 'text');
    expect(model.current.condition.icon, 'icon');
    expect(model.current.humidity, 10);
    expect(model.current.cloud, 11);
    expect(model.current.tempC, 12.0);
    expect(model.current.tempF, 13.0);
    expect(model.current.isDay, 14);
    expect(model.current.windKph, 15.0);
    expect(model.current.pressureIn, 16.00);
    expect(model.current.precipMm, 17.0);
    expect(model.current.visKm, 18.0);
  });
}
