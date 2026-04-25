import 'package:dio/dio.dart';
import 'package:fast_tracking_diet_app/domain/entity/http_response_model.dart';
import 'package:fast_tracking_diet_app/utils/enums/api_type_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class HttpDatasourceContract {
  Future<HttpResponseModel> call({
    required RequestTypeEnum requestType,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool contentTypeJson = true,
  });

  Dio genDioInstance();
}

class HttpDatasource implements HttpDatasourceContract {
  @override
  Future<HttpResponseModel> call({
    required RequestTypeEnum requestType,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool contentTypeJson = true,
  }) async {
    Dio httpRequisitor = genDioInstance();

    if (headers != null) {
      httpRequisitor.options.headers = headers;
      httpRequisitor.options.contentType = contentTypeJson
          ? "application/json"
          : "application/x-www-form-urlencoded";
    } else {
      httpRequisitor.options.headers.clear();
    }

    dynamic response;

    switch (requestType) {
      case RequestTypeEnum.get:
        response = await httpRequisitor.get(url, queryParameters: data);
        break;
      case RequestTypeEnum.post:
        response = await httpRequisitor.post(url, queryParameters: data);
      case RequestTypeEnum.put:
        response = await httpRequisitor.put(url, queryParameters: data);
      case RequestTypeEnum.patch:
        response = await httpRequisitor.patch(url, queryParameters: data);
      case RequestTypeEnum.delete:
        response = await httpRequisitor.delete(url, queryParameters: data);
      case RequestTypeEnum.head:
        response = await httpRequisitor.head(url, queryParameters: data);
    }

    return HttpResponseModel(
      data: response.data,
      headers: response.headers,
      statusCode: response.statusCode,
    );
  }

  @override
  Dio genDioInstance() {
    Dio httpRequisitor = Dio();

    httpRequisitor.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        compact: true,
        enabled: kDebugMode
      )
    );

    return httpRequisitor;
  }
}
