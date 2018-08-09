import 'dart:io' hide ProcessException;

import 'package:grinder/grinder.dart';
import 'package:logging/logging.dart';
import 'package:grind_publish/grind_publish.dart' as grind_publish;

final int dartFmtLineLenght = 80;

main(List<String> args) {
  Logger.root.onRecord.listen((record) => log(record.message));
  grind(args);
}

@Task()
format() => DartFmt.format('.', lineLength: dartFmtLineLenght);

@Task()
checkFormat() {
  if (DartFmt.dryRun('.', lineLength: dartFmtLineLenght))
    fail('Code is not properly formatted. Run `grind format`');
}

@Task('Runs dartanalyzer and makes sure there are no warnings or lint proplems')
analyze() async {
  await runAsync('dartanalyzer',
      arguments: ['.', '--fatal-hints', '--fatal-warnings', '--fatal-lints']);
}

@Task()
testUnit() =>
    // Setting concurrency to 1 because it makes the output more readable and
    // the project is quite small anyway
    new TestRunner().testAsync(files: new Directory('test'), concurrency: 1);

@DefaultTask()
@Depends(checkFormat, analyze, testUnit)
test() => true;

@Task('Automatically publishes this package if the pubspec version increases')
autoPublish() async {
  final credentials = grind_publish.Credentials.fromEnvironment();
  await grind_publish.autoPublish('mandrill', credentials);
}
