part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class getBalanceEvent extends AccountEvent {
  final String pubkey;
  getBalanceEvent({required this.pubkey});
}
