class ApiURL {
  late String _Location;

  String get Location => _Location;

  set Location(String value) {
    _Location = value;
  }

  String getLocation(String Location) =>
      'https://api.openweathermap.org/data/2.5/forecast?q=$Location&appid=25682bfb1b20e2ea67ff21bf8e1f4777&units=metric';
}
