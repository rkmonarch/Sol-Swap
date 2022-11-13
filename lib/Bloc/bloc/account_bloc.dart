import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_phantom_demo/models/balance_response.dart';
import 'package:flutter_phantom_demo/repository/account_repo.dart';
import 'package:meta/meta.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepo accountRepo;
  AccountBloc({required this.accountRepo}) : super(AccountInitial()) {
    on<AccountEvent>((event, emit) async {
      if (event is getBalanceEvent) {
        emit.call(balanceLoading());
        try {
          final BalanceResponse model =
              await accountRepo.getBalance(pubKey: event.pubkey);
          emit.call(balanceSuccess(model: model));
        } catch (e) {
          log(e.toString());
        }
      }
    });
  }
}
