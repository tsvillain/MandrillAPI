import 'package:mandrill/client/client.dart';
import 'package:test/test.dart';

main() {
  group('Client', () {
    group('.formatDate()', () {
      test('handles DateTime properly', () {
        final date = new DateTime.utc(2000, 1, 2, 3, 4, 5);
        expect(MandrillClient.formatDate(date), '2000-01-02 03:04:05');
      });
      test('handles null properly', () {
        expect(MandrillClient.formatDate(null), null);
      });
    });
  });
}
