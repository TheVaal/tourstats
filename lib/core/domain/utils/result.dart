sealed class Result<T> {
  const Result();

  /// Creates an instance of Result containing a value
  factory Result.onSuccess(T value) => Ok(value);

  /// Create an instance of Result containing an error
  factory Result.onError(Exception error) => Error(error);
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  /// Returned value in result
  final T value;
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  const Error(this.error);

  /// Returned error in result
  final Exception error;
}