import 'package:mandrill/src/client.dart';
import 'messages.dart';

part 'src/resources/messages.dart';

class Mandrill {
  final MandrillClient client;

  final Messages messages;

  Mandrill(this.client) : messages = new Messages(client);
}
