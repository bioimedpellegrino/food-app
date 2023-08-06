class Config {
  final String apiUrl;
  final bool isDebug;
  final String locale;

  Config({
    required this.apiUrl,
    required this.isDebug,
    required this.locale
  });

  factory Config.local() {
    return Config(
      apiUrl: 'http://localhost:8000/api/v1',
      isDebug: true,
      locale: 'it_IT'
    );
  }

  factory Config.prod() {
    return Config(
      apiUrl: 'https://api.example.com',
      isDebug: false,
      locale: 'it_IT'
    );
  }
}