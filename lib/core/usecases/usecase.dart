import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  /// Callable class method
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutFuture<Type, Params> {
  /// Callable class method
  Either<Failure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
