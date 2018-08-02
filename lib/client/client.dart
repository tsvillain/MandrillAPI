import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:codable/codable.dart';
import 'package:logging/logging.dart';
import 'package:mandrill/exceptions.dart';
import 'package:mandrill/messages.dart';

class MandrillOptions {
  final String scheme;
  final String host;
  final int port;
  final String pathPrefix;
  final Map<String, String> headers;

  const MandrillOptions({
    this.scheme: 'https',
    this.host: 'mandrillapp.com',
    this.port: 443,
    this.pathPrefix: '/api/1.0/',
    this.headers: const {'Content-Type': 'application/json', 'User-Agent': 'Mandrill-Dart/1.0.4'},
  });
}

typedef T ResponseParser<T extends MandrillResponse>(T responseCoding, dynamic response);

/// The default [ResponseParser] simply takes the response Map, and invokes `.decode(archive)` on the
/// provided [Coding] object.
T defaultResponseParser<T extends MandrillResponse>(T responseCoding, dynamic response) {
  if (response is! Map) {
    // If this exception is thrown here, it probably means that you need to provide your own
    // ResponseParser (or Mandrill is bugging out).
    throw new InvalidResponseException('The returned response was not a Map.');
  }
  final archive = KeyedArchive.unarchive(response);
  return responseCoding..decode(archive);
}

/// The base class for the Mandrill HTTP client.
/// There is a server and a browser implementation of this client.
abstract class MandrillClient {
  final _log = new Logger('MandrillClient');

  final String apiKey;

  final MandrillOptions options;

  MandrillClient(this.apiKey, [MandrillOptions options]) : this.options = options ?? const MandrillOptions();

  Future<T> call<T extends MandrillResponse>(String path, Map body, T responseCoding,
      {ResponseParser<T> responseParser: defaultResponseParser}) async {
    final uri = new Uri(
      scheme: options.scheme,
      host: options.host,
      port: options.port,
      path: '${options.pathPrefix}$path.json',
    );

    final bodyWithKey = new Map.from(body)..['key'] = apiKey;

    _log.finer('Making Mandrill request to $uri');
    final responseMap = await request(uri, options.headers, jsonEncode(bodyWithKey));
    return responseParser(responseCoding, responseMap);
  }

  /// The function that does the actual HTTP request.
  Future<dynamic> request(Uri uri, Map<String, String> headers, String body);

  /// Parses the body and returns a [Map] of the decoded json.
  /// If the [statusCode] is not 200, then a [MandrillException] is thrown.
  dynamic handleResponse(int statusCode, String body) {
    if (statusCode != 200) {
      MandrillException error;
      try {
        final errorArchive = KeyedArchive.unarchive(jsonDecode(body));
        final errorResponse = new ErrorResponse()..decode(errorArchive);

        error = MandrillException.fromError(errorResponse);
      } catch (e) {
        _log.warning('The body returned by Mandrill could not be parsed properly: $body');
        error = new InvalidResponseException('We received an unexpected error: $e');
      }
      throw error;
    }

    return jsonDecode(body);
  }

  static DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  static String formatDate(DateTime date) => date == null ? null : _dateFormat.format(date.toUtc());
}
