import 'dart:io' hide ProcessException;

import 'package:grinder/grinder.dart';
import 'package:logging/logging.dart';

final int dartFmtLineLenght = 120;

main(List<String> args) {
  Logger.root.onRecord.listen((record) => log(record.message));
  grind(args);
}

@Task()
format() => DartFmt.format('.', lineLength: dartFmtLineLenght);

@Task()
checkFormat() {
  if (DartFmt.dryRun('.', lineLength: dartFmtLineLenght)) fail('Code is not properly formatted. Run `grind format`');
}

@Task('Runs dartanalyzer')
analyze() async {
  final executable = 'dartanalyzer', arguments = ['--fatal-infos', '--fatal-warnings', '.'];
  log('$executable ${arguments.join(' ')}');
  final result = Process.runSync(executable, arguments);

  if (result.exitCode != 0) {
    log(result.stdout.toString());
    fail('Analyzer discovered problems');
  } else {
    log('All good!');
  }
}

@Task()
testUnit() => new TestRunner().testAsync(files: new Directory('test'), concurrency: 4);

@DefaultTask()
@Depends(checkFormat, analyze, testUnit)
test() => true;
