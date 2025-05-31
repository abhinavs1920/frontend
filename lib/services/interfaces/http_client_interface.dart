/// Interface for HTTP client operations
abstract class HttpClientInterface {
  /// Send a GET request to the specified URL
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
  });

  /// Send a POST request to the specified URL
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  });

  /// Close the HTTP client and clean up resources
  void close();
}
