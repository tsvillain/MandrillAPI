part of '../../mandrill.dart';

class Messages {
  final MandrillClient client;

  Messages(this.client);

  Future<SentMessagesResponse> send(
    OutgoingMessage message, {
    bool sendAsync: false,
    String ipPool,
    DateTime sendAt,
  }) async {
    final body = {
      'message': KeyedArchive.archive(message),
      'async': sendAsync,
      'ip_pool': ipPool,
      'send_at': MandrillClient.formatDate(sendAt),
    };

    return await client.call('messages/send', body, new SentMessagesResponse(), responseParser: (coding, response) {
      // An individual response parser is necessary here, because Codable can't handle Lists.
      response = {'sent_messages': response};
      final archive = KeyedArchive.unarchive(response);
      return coding..decode(archive);
    });
  }
}
