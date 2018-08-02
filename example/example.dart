import 'package:logging/logging.dart';
import 'package:mandrill/mandrill_server.dart';

const apiKey = 'your-key';

void main() async {
  Logger.root
    ..level = Level.ALL
    ..onRecord.listen(print);

  final log = new Logger('Mandrill Example');

  final mandrill = createMandrill(apiKey);

  final message = new OutgoingMessage(
    html: '<h1>Welcome to our website</h1>',
    text: 'WELCOME TO OUR WEBSITE',
    fromEmail: 'good@website.com',
    fromName: 'Greatest Website',
    to: [
      new Recipient(email: 'customer1@example-domain.com', name: 'Customer 1'),
      new Recipient(email: 'customer2@example-domain.com', name: 'Customer 2', type: RecipientType.bcc),
    ],
    important: true,
  );

  try {
    final response = await mandrill.messages.send(message);
    log.info('${response.sentMessages.length} messages have been sent.');
  } on MandrillException catch (e) {
    log.severe(e.toString());
  }
}
