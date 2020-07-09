class Result<T> {
  Result._();

  factory Result.success(T value) => Success(value);

  factory Result.error(T error) => Error(error);
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value) : super._();
}

class Error<T> extends Result<T> {
  final T error;

  Error(this.error) : super._();
}
