part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class balanceLoading extends AccountState {}

class balanceSuccess extends AccountState {
  final BalanceResponse model;
  balanceSuccess({required this.model});
}


class LargestAccuntLoading extends AccountState{}

class LargestAccountSuccess extends AccountState{}