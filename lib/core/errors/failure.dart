import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? msg;

  const Failure({this.msg});

  @override
  List<Object?> get props => [msg];
}

// General failures

class DatabaseFailure extends Failure {
  const DatabaseFailure({super.msg});
}

class InternalFailure extends Failure {
  const InternalFailure({super.msg});
}

class CacheFailure extends Failure {
  const CacheFailure({super.msg});
}

class ServerFailure extends Failure {
  const ServerFailure({super.msg});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.msg});
}
