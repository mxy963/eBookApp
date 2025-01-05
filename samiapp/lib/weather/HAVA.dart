
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Weather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final IconData icon;

  Weather({
    required this.temp,
    required this.feelsLike,
    required this.low,
    required this.high,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      icon: _getWeatherIcon(json['weather'][0]['main']),
    );
  }

  static IconData _getWeatherIcon(String main) {
    switch (main.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.beach_access;
      case 'snow':
        return Icons.ac_unit;
      default:
        return Icons.error;
    }
  }

  Color get color {
    if (temp > 25) return Colors.red;
    if (temp > 15) return Colors.orange;
    return Colors.blue;
  }

  String get tempString => '${temp.toStringAsFixed(1)}°C';
  String get feelsLikeString => 'Feels like: ${feelsLike.toStringAsFixed(1)}°C';
  String get lowString => 'Low: ${low.toStringAsFixed(1)}°C';
  String get highString => 'High: ${high.toStringAsFixed(1)}°C';
}

List<Weather> weatherInfo = [];