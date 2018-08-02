import 'package:codable/codable.dart';
import 'package:meta/meta.dart';

part 'src/messages/messages.dart';
part 'src/messages/error.dart';

abstract class _Coding extends Coding {
  List<Map<String, dynamic>> _toVarList(Map<String, dynamic> vars) => vars == null
      ? null
      : vars.keys.map<Map<String, dynamic>>((key) => {'name': key, 'content': vars[key]}).toList(growable: false);
}

/// Use this class if you do not intend on implementing the [Coding.encode] method.
abstract class MandrillResponse extends _Coding {
  /// Not implemented. Do not invoke!
  @override
  void encode(_) => throw new UnimplementedError('This message cannot be encoded.');
}

/// Use this class if you do not intend on implementing the [Coding.decode] method.
abstract class Encoding extends _Coding {
  /// Not implemented. Do not invoke!
  @override
  // ignore: must_call_super
  void decode(_) => throw new UnimplementedError('This message cannot be decoded.');
}
