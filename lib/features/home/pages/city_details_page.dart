import 'package:flutter/material.dart';
import 'package:your_weather/models/weather_model.dart';

class CityDetailsPage extends StatelessWidget {
  final WeatherModel weatherModel;

  const CityDetailsPage({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mapa.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
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
                                '${weatherModel.windkKph.toString()}km/h',
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
                ),
                const SizedBox(height: 100),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
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
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weather details'.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GridDetailsElement(
                              imagePath: 'images/atmospheric.png',
                              text: weatherModel.pressure
                                  .toString(), // ciśnienie atmosferyczne
                            ),
                            GridDetailsElement(
                              imagePath: 'images/rainfall.png',
                              text:
                                  '${weatherModel.precipMm.toString()}mm', // Opady deszczu
                            ),
                            GridDetailsElement(
                              imagePath: 'images/humidity.png',
                              text:
                                  '${weatherModel.humidity.toString()}%', // wilgotność
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GridDetailsElement(
                              imagePath: 'images/cloudy.png',
                              text:
                                  '${weatherModel.cloud.toString()}%', // zachmurzenie
                            ),
                            GridDetailsElement(
                              imagePath: 'images/frhtemperature.png',
                              text:
                                  '${weatherModel.tempF.toString()}°F', // temperatura frh
                            ),
                            GridDetailsElement(
                              imagePath: 'images/visibility.png',
                              text:
                                  '${weatherModel.visKm.toString()}km', // widoczność
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridDetailsElement extends StatelessWidget {
  const GridDetailsElement(
      {super.key, required this.imagePath, required this.text});

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 152, 195, 224),
            Color.fromARGB(255, 88, 95, 121),
            Color.fromARGB(255, 66, 72, 94),
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
          SizedBox(
            height: 40,
            width: 40,
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          const Text('data'),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
