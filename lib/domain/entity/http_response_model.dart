class HttpResponseModel<T> {
  T? data;
  T? headers;
  int statusCode;

  HttpResponseModel({this.data, this.headers, required this.statusCode});
}
