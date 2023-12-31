class WeatherModel {
  final String city;
  final String date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String condition;
  final String? image;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.condition,
      required this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        city: json['location']['name'],
        date: json['location']['localtime'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  } 
}
