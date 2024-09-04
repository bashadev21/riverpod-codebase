import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String? msg;
  final RequestOptions? options;

  const Failure({this.msg, this.options});

  @override
  List<Object?> get props => [msg];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({super.msg, super.options});
}

class CacheFailure extends Failure {
  const CacheFailure({super.msg, super.options});
}

class ServerFailure extends Failure {
  const ServerFailure({super.msg, super.options});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.msg, super.options});
}

class TimeOutFailure extends Failure {
  const TimeOutFailure({super.msg, super.options});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.msg, super.options});
}

class UnauthorisedFailure extends Failure {
  const UnauthorisedFailure({super.msg, super.options});
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure({super.msg, super.options});
}

class InternalFailure extends Failure {
  const InternalFailure({super.msg, super.options});
}

class BadGateWayFailure extends Failure {
  const BadGateWayFailure({super.msg, super.options});
}
