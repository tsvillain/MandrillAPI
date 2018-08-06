part of '../../mandrill.dart';

class Messages {
  final MandrillClient client;

  Messages(this.client);

  /// - `sendAsync`: enable a background sending mode that is optimized for bulk sending. In async mode, messages/send
  ///   will immediately return a status of "queued" for every recipient. To handle rejections when sending in async
  ///   mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients;
  ///   messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
  /// - `ipPool`: the name of the dedicated ip pool that should be used to send the message. If you do not have any
  ///   dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will
  ///   be used instead.
  /// - `sendAt`: when this message should be sent. If you specify a time in the past, the message will be sent
  ///   immediately. An additional fee applies for scheduled email, and this feature is only available to accounts with
  ///   a positive balance.
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
