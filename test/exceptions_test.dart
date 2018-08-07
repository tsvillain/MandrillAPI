import 'package:mandrill/exceptions.dart';
import 'package:mandrill/messages.dart';
import 'package:test/test.dart';

main() {
  group('MandrillException', () {
    test('.fromError() creates the right exception', () {
      ErrorResponse errorResponse;

      errorResponse = new ErrorResponse()..name = 'Unknown_Template';
      expect(MandrillException.fromError(errorResponse),
          TypeMatcher<UnknownTemplateException>());

      errorResponse = new ErrorResponse()..name = 'Invalid_CustomDNSPending';
      expect(MandrillException.fromError(errorResponse),
          TypeMatcher<InvalidCustomDnsPendingException>());
    });
  });
}
