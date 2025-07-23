import 'dart:convert';

import 'package:app/config/environment.dart';
import 'package:app/utils/enum.dart';
import 'package:app/utils/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

part 'api_path.dart';

mixin Api {
  Client http = Client();

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    final result = await http
        .get(_uriHandler(url, params), headers: _header())
        .timeout(Duration(seconds: TimeoutDuration.short.value));
    return result;
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? params,
    Object? body,
  }) async {
    if (body is MultiPartBody) {
      final request = MultipartRequest("POST", _uriHandler(url, params));
      request.headers.addAll(_headerFile());
      request.fields.addAll(body.fields ?? {});
      body.files?.forEach((k, v) async {
        if (_validAttachment(v)) {
          request.files.add((await MultipartFile.fromPath(k, v)));
        }
      });
      final mRequest = await request.send().timeout(
        Duration(seconds: TimeoutDuration.long.value),
      );
      final result = await Response.fromStream(mRequest);
      return result;
    } else {
      final result = await http
          .post(
            _uriHandler(url, params),
            headers: _header(),
            body: jsonEncode(body),
          )
          .timeout(Duration(seconds: TimeoutDuration.short.value));
      return result;
    }
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? params,
    Object? body,
  }) async {
    if (body is MultiPartBody) {
      if (body.isUrlEncoded) {
        final result = await http
            .put(
              _uriHandler(url, params),
              headers: _headerFile(),
              body: body.fields,
            )
            .timeout(Duration(seconds: TimeoutDuration.long.value));
        return result;
      } else {
        final request = MultipartRequest("PUT", _uriHandler(url, params));
        request.headers.addAll(_headerFile());
        request.fields.addAll(body.fields ?? {});
        body.files?.forEach((k, v) async {
          if (_validAttachment(v)) {
            request.files.add((await MultipartFile.fromPath(k, v)));
          }
        });
        if (kDebugMode) {
          print(request.fields);
          print(_headerFile());
        }
        final mRequest = await request.send().timeout(
          Duration(seconds: TimeoutDuration.long.value),
        );
        final result = await Response.fromStream(mRequest);
        return result;
      }
    } else {
      final result = await http
          .put(
            _uriHandler(url, params),
            headers: _header(),
            body: jsonEncode(body),
          )
          .timeout(Duration(seconds: TimeoutDuration.short.value));
      return result;
    }
  }

  Future<Response> patch(
    String url, {
    Map<String, dynamic>? params,
    Object? body,
  }) async {
    if (body is MultiPartBody) {
      final request = MultipartRequest("PATCH", _uriHandler(url, params));
      request.headers.addAll(_headerFile());
      request.fields.addAll(body.fields ?? {});
      body.files?.forEach((k, v) async {
        if (_validAttachment(v)) {
          request.files.add((await MultipartFile.fromPath(k, v)));
        }
      });
      final mRequest = await request.send().timeout(
        Duration(seconds: TimeoutDuration.long.value),
      );
      final result = await Response.fromStream(mRequest);
      return result;
    } else {
      final result = await http
          .patch(
            _uriHandler(url, params),
            headers: _header(),
            body: jsonEncode(body),
          )
          .timeout(Duration(seconds: TimeoutDuration.short.value));
      return result;
    }
  }

  Future<Response> delete(
    String url, {
    Object? body,
    Map<String, dynamic>? params,
  }) async {
    final result = await http
        .delete(
          _uriHandler(url, params),
          body: jsonEncode(body),
          headers: _header(),
        )
        .timeout(Duration(seconds: TimeoutDuration.short.value));
    return result;
  }

  Future<Response> exampleResponse(String body, int statusCode) async {
    await Future.delayed(const Duration(seconds: 2));
    return Response(body, statusCode);
  }

  Uri _uriHandler(String url, Map<String, dynamic>? params) {
    final dev = envMode == "development";
    final scheme = dev ? Environment.schemaDev : Environment.schemaProd;
    final host = dev ? Environment.hostDev : Environment.hostProd;
    final path = dev ? Environment.pathDev : Environment.pathProd;

    print('print $scheme $host $path');
    return Uri(
      scheme: scheme,
      host: host,
      path: '$path/$url',
      queryParameters: params,
    );
  }

  String get _token => LocalStorage.getString('token');

  Map<String, String> _header() {
    Map<String, String> header = {};
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/json";
    if (_token.isNotEmpty) {
      header["Authorization"] = "Bearer $_token";
    }
    return header;
  }

  Map<String, String> _headerFile() {
    Map<String, String> header = {};
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/x-www-form-urlencoded";
    if (_token.isNotEmpty) {
      header["Authorization"] = "Bearer $_token";
    }
    return header;
  }

  bool _validAttachment(String? attachment) {
    String newPath = attachment ?? "";
    return newPath.isNotEmpty &&
        !newPath.startsWith("http") &&
        !newPath.startsWith("https");
  }
}

class MultiPartBody {
  final Map<String, String>? fields;
  final Map<String, String>? files;
  final bool isUrlEncoded;

  const MultiPartBody({this.fields, this.files, this.isUrlEncoded = false});
}
