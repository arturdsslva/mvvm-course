sealed class Result<T> {
  const Result();

  factory Result.ok(T value) = Ok._;
  factory Result.err(Exception error) = Err._;
}

final class Ok<T> extends Result<T> {
  final T value;
  const Ok._(this.value);
}

final class Err<T> extends Result<T> {
  final Exception error;
  const Err._(this.error);
}

extension ResultExtension<T> on T {
  Result<T> ok() => Result.ok(this);
}

extension ResultExceptionExtension on Exception {
  Result<Never> error() => Result.err(this);
}

extension ResultCastingExtension<T> on Result<T> {
  Ok<T> get asOk => this as Ok<T>;
  Err<T> get asErr => this as Err<T>;
}
