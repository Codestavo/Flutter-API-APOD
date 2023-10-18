class NasaEndpoint {
  static String apod(String apiKey, String date) {
    return "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date";
  }
}
