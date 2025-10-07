import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_course/core/commands/commands.dart';
import 'package:mvvm_course/core/result/result.dart';

void main() {
  group('should test Commands', () {
    test('should create Command0', () {
      final command = Command0<int>(() async => Result.ok(42));
      expect(command, isA<Command0<int>>());
      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);
    });
    test('should execute Command0 successfully', () async {
      final command = Command0<int>(() async => Result.ok(100));

      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      final future = command.execute();

      expect(command.running, true);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      await future;

      expect(command.running, false);
      expect(command.result, isA<Ok<int>>());
      expect(command.result!.asOk.value, 100);
      expect(command.completed, true);
      expect(command.error, false);
    });
    test('should execute Command0 with error', () async {
      final exception = Exception('Command failed');
      final command = Command0<int>(() async => Result.err(exception));

      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      final future = command.execute();

      expect(command.running, true);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      await future;

      expect(command.running, false);
      expect(command.result, isA<Err<int>>());
      expect(command.result!.asErr.error, exception);
      expect(command.completed, false);
      expect(command.error, true);
    });
    test('should create Command1', () {
      final command = Command1<String, int>(
        (input) async => Result.ok('Value: $input'),
      );
      expect(command, isA<Command1<String, int>>());
      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);
    });
    test('should execute Command1 successfully', () async {
      final command = Command1<String, int>(
        (input) async => Result.ok('Value: $input'),
      );

      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      final future = command.execute(55);

      expect(command.running, true);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      await future;

      expect(command.running, false);
      expect(command.result, isA<Ok<String>>());
      expect(command.result!.asOk.value, 'Value: 55');
      expect(command.completed, true);
      expect(command.error, false);
    });
    test('should execute Command1 with error', () async {
      final exception = Exception('Command1 failed');
      final command = Command1<String, int>(
        (input) async => Result.err(exception),
      );

      expect(command.running, false);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      final future = command.execute(55);

      expect(command.running, true);
      expect(command.result, null);
      expect(command.completed, false);
      expect(command.error, false);

      await future;

      expect(command.running, false);
      expect(command.result, isA<Err<String>>());
      expect(command.result!.asErr.error, exception);
      expect(command.completed, false);
      expect(command.error, true);
    });
  });
}
