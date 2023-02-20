import 'package:equatable/equatable.dart';

/// Abstract of Failure
abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Indicate that is a Server Failure
class ServerFailure extends Failure {}
