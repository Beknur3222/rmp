import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: const Text('Weather'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(child: Weather()),
            ],
          ),
        ),
      ),
    );
  }
}



const apiKey = '3568e2fd43cb338d9e39bf984ddff490'; // ключ

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeatherState();
  }
}

class WeatherState extends State<Weather> {
  final List<String> cities = ['Almaty', 'Shymkent', 'Astana', 'Aktau', 'Atyrau', 'Aktobe', 'Oral', 'Taraz', 'Oskemen', 'Kyzylorda'];
  String selectedCity = 'Almaty';
  String temperature = '';
  String weatherIcon = '';

  Future<void> fetchWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$selectedCity&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);

      setState(() {
        temperature = data['main']['temp'].toStringAsFixed(1);
        weatherIcon = data['weather'][0]['icon'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 1050,
          child: Image(
            image: AssetImage('assets/images/sky.png'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedCity,
                items: cities
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCity = value!;
                  });
                  fetchWeatherData();
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedCity,
                    style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent),
                  ),
                  weatherIcon.isEmpty
                      ? const CircularProgressIndicator()
                      : Image.network(
                    'https://openweathermap.org/img/w/$weatherIcon.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                  Text(
                    '$temperature°C',
                    style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

