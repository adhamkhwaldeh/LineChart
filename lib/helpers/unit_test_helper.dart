import 'dart:io';

class UnitTestHelper {
  static bool isUnitTest() {
    return Platform.environment.containsKey('FLUTTER_TEST');
  }
}
