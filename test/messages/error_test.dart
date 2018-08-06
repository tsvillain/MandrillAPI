import 'dart:convert';

import 'package:codable/codable.dart';
import 'package:mandrill/messages.dart';
import 'package:test/test.dart';

import '../test_data.dart' as test_data;

main() {
  group('Error', () {
    group('ErrorResponse', () {
      test('properly decodes object', () {
        final json = jsonDecode(test_data.errorResponse);
        final archive = KeyedArchive.unarchive(json);
        final errorResponse = ErrorResponse()..decode(archive);

        expect(errorResponse.name, json['name']);
        expect(errorResponse.code, json['code']);
        expect(errorResponse.status, json['status']);
        expect(errorResponse.message, json['message']);
      });
    });
  });
}
