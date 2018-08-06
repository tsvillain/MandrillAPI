import 'dart:async';
import 'dart:convert';

import 'package:mandrill/mandrill.dart';
import 'package:mandrill/messages.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks.dart';
import '../test_data.dart' as test_data;

main() {
  group('Messages resource', () {
    Messages messages;
    MockMandrillClient mockClient;

    setUp(() {
      mockClient = new MockMandrillClient();
      messages = new Messages(mockClient);
    });

    group('.send', () {
      test('.fromString() works with all types', () async {
        when(mockClient.call<SentMessagesResponse>('messages/send', captureAny, captureAny,
                responseParser: captureAnyNamed('responseParser')))
            .thenAnswer((invocation) {
          SentMessagesResponse response = invocation.positionalArguments[2];
          Function parser = invocation.namedArguments[new Symbol('responseParser')];
          return new Future.value(parser(response, jsonDecode(test_data.sendMessageResponse)));
        });

        final message = new OutgoingMessage(text: 'text content', inlineCss: true);
        final response = await messages.send(message, sendAsync: true, sendAt: new DateTime.utc(2029, 1, 1));

        final verificationResult = verify(mockClient.call<SentMessagesResponse>('messages/send', captureAny, captureAny,
            responseParser: captureAnyNamed('responseParser')));
        verificationResult.called(1);
        final body = verificationResult.captured[0];

        expect(body, {
          'message': {'text': 'text content', 'inline_css': true},
          'async': true,
          'ip_pool': null,
          'send_at': '2029-01-01 00:00:00'
        });

        expect(response, const TypeMatcher<SentMessagesResponse>());
        expect(response.sentMessages, hasLength(2));
        expect(response.sentMessages.first.email, 'recipient.email@example.com');
      });
    });
  });
}
