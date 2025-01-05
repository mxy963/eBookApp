import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:samiapp/weather/HAVA.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Hava extends StatefulWidget {
  const Hava({super.key});

  @override
  State<Hava> createState() => _HavaState();
}

class _HavaState extends State<Hava> {
  List<Weather> weatherInfo = [];

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlue.shade200],
          ),
        ),
        child: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  getCurrentWeather();
                });
              },
              child: weatherInfo.isNotEmpty
                  ? ListView(
                      children: [weatherBox()],
                    )
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget weatherBox() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              weatherInfo[0].icon,
              size: 80,
              color: weatherInfo[0].color,
            ),
            const SizedBox(height: 20),
            Text(
              "${weatherInfo[0].temp.round()}°C",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 55,
                color: Colors.black87,
              ),
            ),
            Text(
              weatherInfo[0].description,
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thermostat, color: Colors.orange),
                Text(
                  " Feels like: ${weatherInfo[0].feelsLike.round()}°C",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.arrow_upward, color: Colors.red),
                    Text(
                      "High: ${weatherInfo[0].high.round()}°C",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.arrow_downward, color: Colors.blue),
                    Text(
                      "Low: ${weatherInfo[0].low.round()}°C",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Weather>> getCurrentWeather() async {
    const String city = "ankara";
    const String apiKey = "1d34f926265b58a505fcdf8a5d60b5b1";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        weatherInfo = [Weather.fromJson(data)];
        return weatherInfo;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
