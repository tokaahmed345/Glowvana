part of 'sign_out_cubit.dart';

sealed class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

final class SignOutInitial extends SignOutState {}
final class SignOutLaoding extends SignOutState {}
final class SignOutSuccess extends SignOutState {}
final class SignOutFailure extends SignOutState {
final String errorMessage;
const SignOutFailure({required this.errorMessage});
}

