import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String? msg;
  final RequestOptions? requestOptions;

  const Failure({this.msg, this.requestOptions});

  @override
  List<Object?> get props => [msg];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({super.msg, super.requestOptions});
}

class InternalFailure extends Failure {
  const InternalFailure({super.msg, super.requestOptions});
}

class CacheFailure extends Failure {
  const CacheFailure({super.msg, super.requestOptions});
}

class ServerFailure extends Failure {
  const ServerFailure({super.msg, super.requestOptions});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.msg, super.requestOptions});
}

class TimeOutFailure extends Failure {
  const TimeOutFailure({super.msg, super.requestOptions});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.msg, super.requestOptions});
}

class UnauthorisedFailure extends Failure {
  const UnauthorisedFailure({super.msg, super.requestOptions});
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure({super.msg, super.requestOptions});
}

class InternalServerFailure extends Failure {
  const InternalServerFailure({super.msg, super.requestOptions});
}

class BadGateWayFailure extends Failure {
  const BadGateWayFailure({super.msg, super.requestOptions});
}
