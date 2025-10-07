import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_course/core/result/result.dart';

void main() {
  group('should test Ok Result -', () {
    test('should create Ok Result with value', () {
      final result = Result.ok(42);
      expect(result, isA<Ok<int>>());
      expect(result.asOk.value, 42);
    });
    test('Ok Result should not be Error', () {
      final result = Result.ok('Hello');
      expect(result, isNot(isA<Error>()));
    });
    test('should create an Ok Result with value using extension', () {
      final value = 'Test Value';
      final result = value.ok();
      expect(result.asOk.value, value);
    });
    test('should create Error Result with exception', () {
      final exception = Exception('An error occurred');
      final result = Result<String>.err(exception);
      expect(result, isA<Err<String>>());
      expect(result.asErr.error, exception);
    });
    test('Error Result should not be Ok', () {
      final exception = Exception('Another error');
      final result = Result<int>.err(exception);
      expect(result, isNot(isA<Ok<Object>>()));
    });
  });
}
