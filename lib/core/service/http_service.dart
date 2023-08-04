import 'package:http/http.dart' as http;

class HttpService {
  Future<T> call<T>({
    required String url,
    RestType? type,
    dynamic body,
    Map<String, String>? headers,
    T Function(String)? fromJson,
  }) async {
    http.Response response;
    final localHeader = headers ?? {'Content-Type': 'application/json'};

    switch (type) {
      case RestType.get:
        response = await http.get(
          Uri.parse(url),
          headers: localHeader,
        );
        break;
      case RestType.post:
        response = await http.post(
          Uri.parse(url),
          headers: localHeader,
          body: body,
        );
        break;
      default:
        throw Exception('Invalid request type: $type');
    }

    return _handleResponse<T>(response, fromJson: fromJson);
  }

  T _handleResponse<T>(
    http.Response response, {
    T Function(String)? fromJson,
  }) {
    final statusCode = [202, 400, 500].contains(response.statusCode);
    if (fromJson != null && statusCode == false) {
      try {
        return fromJson(response.body);
      } catch (e) {
        throw Exception('Failed to parse JSON response: $e');
      }
    } else if (statusCode == false) {
      try {
        return response.body as T;
      } catch (e) {
        throw Exception('Failed to cast response to type $T: $e');
      }
    } else {
      return fromJson!(response.body);
    }
  }
}

enum RestType {
  get,
  post,
  put,
  delete,
}
