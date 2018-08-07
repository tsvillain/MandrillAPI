import 'package:codable/codable.dart';
import 'package:meta/meta.dart';

import 'src/utils.dart' as utils;

part 'src/messages/error.dart';
part 'src/messages/messages.dart';

/// Use this class if you do not intend on implementing the [Coding.encode] method.
abstract class MandrillResponse extends Coding {
  /// Not implemented. Do not invoke!
  @override
  void encode(_) =>
      throw new UnimplementedError('This message cannot be encoded.');
}

/// Use this class if you do not intend on implementing the [Coding.decode] method.
abstract class Encoding extends Coding {
  /// Not implemented. Do not invoke!
  @override
  // ignore: must_call_super
  void decode(_) =>
      throw new UnimplementedError('This message cannot be decoded.');
}
