part of '../../mandrill.dart';

class Messages {
  final MandrillClient client;

  Messages(this.client);

  SentMessagesResponse send(OutgoingMessage send) {
    throw UnimplementedError();
  }
}
