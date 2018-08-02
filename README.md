# Mandrill API

This is a native dart implementation of a [Mandrill API](https://mandrillapp.com/api/docs/) client.

It's not a fork of the other `mandrill_api` package, because the other library is quite old, unmaintained
and not very suitable to be ported to Dart 2.0

## Usage

```dart
import 'package:mandrill/mandrill_server.dart';
// or if you're in the browser:
// import 'package:mandrill/mandrill_browser.dart';

final apiKey = 'your-key';

main() async {
  final mandrill = createMandrill(apiKey);

  final recipients = [
    new Recipient(email: 'customer1@example.com', name: 'Customer 1'),
    new Recipient(email: 'customer2@example.com', name: 'Customer 2', type: RecipientType.bcc),
  ];

  final message = new OutgoingMessage(
    html: '<h1>Welcome to our website</h1>',
    text: 'WELCOME TO OUR WEBSITE',
    to: recipients,
    /* etc... */
  );

  final response = await mandrill.messages.send(message);
}
```

For a full example, please see `example/example.dart`.


## Stability

This library is meant to be rock solid, using [Codable](https://pub.dartlang.org/packages/codable) to
(de)serialize JSON messages, well tested and used in production.

## Completeness

We have only implemented a subset of the full API calls, because we don't need the other calls right now.

To see which API calls have been implemented, please check the
[API Documentation](https://pub.dartlang.org/documentation/mandrill/latest/).

If you need other resources to be implemented we are happy to accept Merge Requests, but we are also willing to
add new resources if requested.

## License

MIT