abstract class Result<T extends Object> {
  const Result();

  factory Result.ok(T value) = Ok._;
  factory Result.error(Exception error) = Error._;
}

final class Ok<T extends Object> extends Result<T> {
  final T value;
  const Ok._(this.value);
}

final class Error<T extends Object> extends Result<T> {
  final Exception error;
  const Error._(this.error);
}

extension ResultExtension on Object {
  Result ok() => Result.ok(this);
}

extension ResultExceptionExtension on Exception {
  Result error() => Result.error(this);
}

extension ResultCastingExtension<T extends Object> on Result<T> {
  Ok<T> get asOk => this as Ok<T>;
  Error<T> get asError => this as Error<T>;
}
