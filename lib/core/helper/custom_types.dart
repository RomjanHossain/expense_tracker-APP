import 'package:dartz/dartz.dart';

typedef ResultFutureOrException<T> = Future<Either<T, Exception>>;
typedef ResultFuture<T> = Future<T>;
