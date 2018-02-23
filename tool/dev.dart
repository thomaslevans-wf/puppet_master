import 'package:dart_dev/dart_dev.dart';

main(args) async {
  var directories = ['lib/', 'test/unit/', 'tool/'];

  config.analyze.entryPoints = directories;

  config.copyLicense.directories = directories;

  config.coverage.reportOn = ['lib/'];

  config.format
    ..paths = directories
    ..exclude = ['test/'];

  config.genTestRunner.configs = [
    new TestRunnerConfig(directory: 'test/unit/', env: Environment.vm)
  ];

  config.test
    ..concurrency = 1
    ..platforms = ['vm']
    ..integrationTests = []
    ..unitTests = ['test/unit/generated_runner.dart'];

  await dev(args);
}
