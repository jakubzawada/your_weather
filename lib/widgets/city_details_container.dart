import 'package:flutter/material.dart';
import 'package:your_weather/models/weather_model.dart';

class CityDetailsContainer extends StatelessWidget {
  const CityDetailsContainer({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 26,
          ) +
          const EdgeInsets.only(top: 110),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 72, 158, 216),
            Color.fromARGB(255, 101, 129, 239),
            Color.fromARGB(255, 138, 159, 242),
          ],
          tileMode: TileMode.mirror,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weatherModel.city,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                child: Image.network(
                  'http:${weatherModel.icon}',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${weatherModel.temperature.toString()}°C',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.air,
                      color: Color.fromARGB(50, 255, 255, 255),
                      size: 70,
                    ),
                  ),
                  Text(
                    '${weatherModel.windKph.toString()}km/h',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
