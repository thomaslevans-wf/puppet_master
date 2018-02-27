@TestOn('vm')
library test.unit.generated_runner;

// Generated by `pub run dart_dev gen-test-runner -d test/unit/ -e Environment.vm --no-genHtml`

import './multi_map_test.dart' as multi_map_test;
import './us_keyboard_layout_test.dart' as us_keyboard_layout_test;
import 'package:test/test.dart';

void main() {
  multi_map_test.main();
  us_keyboard_layout_test.main();
}