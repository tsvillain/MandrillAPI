# Mandrill API

This is a native dart implementation of a [Mandrill API](https://mandrillapp.com/api/docs/) client.

It's not a fork of the other `mandrill_api` package, because the other library is quite old, unmaintained
and not very suitable to be ported to Dart 2.0

## Stability

This library is meant to be rock solid, using [Codable](https://pub.dartlang.org/packages/codable) to
(de)serialize JSON messages, well tested and used in production.

## Completeness

We have only implemented a subset of the full API calls, because we don't need the other calls right now.

To see which API calls have been implemented, please check the
[API Documentation](https://pub.dartlang.org/documentation/mandrill/latest/).

If you need other resources to be implemented we are happy to accept Merge Requests, but we are also willing to
add new resources if requested.

