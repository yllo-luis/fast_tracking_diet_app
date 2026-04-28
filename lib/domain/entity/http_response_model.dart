/// A generic model representing an HTTP response.
///
/// This model encapsulates the response [data], [headers], and [statusCode]
/// returned from an HTTP request.
class HttpResponseModel<T> {
  /// The body data of the response.
  ///
  /// Typically a [Map] or [List] depending on the API response.
  T? data;

  /// The response headers returned by the server.
  T? headers;

  /// The HTTP status code returned by the server.
  int statusCode;

  /// Creates a new [HttpResponseModel] instance.
  HttpResponseModel({this.data, this.headers, required this.statusCode});
}
