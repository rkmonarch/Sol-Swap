import 'dart:convert';

import 'package:Sol_Swap/models/balance_response.dart';
import 'package:Sol_Swap/models/largest_account_response.dart';
import 'package:Sol_Swap/models/total_supply_response.dart';
import 'package:http/http.dart' as http;

abstract class AccountRepo {
  Future<BalanceResponse> getBalance({required String pubKey});
  Future<largetsAccountResponse> getLargestAccount();
  Future<TotalSupplyResponse> getTotalSupply();
}

class AccountIMPL extends AccountRepo {
  @override
  Future<BalanceResponse> getBalance({required String pubKey}) async {
    var data = json.encode({
      "jsonrpc": "2.0",
      "id": 1,
      "method": "getAccountInfo",
      "params": [
        pubKey,
      ]
    });
    final response = await http.post(Uri.parse("https://api.devnet.solana.com"),
        headers: {'Content-Type': 'application/json'}, body: data);
    print(">>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>${data}");
    print(">>>>>>>>>>>>>>>>${response.body}");
    if (response.statusCode == 200) {
      return BalanceResponse.fromJson(jsonDecode(response.body));
    }
    throw UnimplementedError();
  }

  @override
  Future<largetsAccountResponse> getLargestAccount() async {
    var data = json
        .encode({"jsonrpc": "2.0", "id": 1, "method": "getLargestAccounts"});
    final response = await http.post(
        Uri.parse("https://api.mainnet-beta.solana.com"),
        headers: {'Content-Type': 'application/json'},
        body: data);
    print(">>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>${data}");
    print(">>>>>>>>>>>>>>>>${response.body}");
    if (response.statusCode == 200) {
      return largetsAccountResponse.fromJson(jsonDecode(response.body));
    }
    throw UnimplementedError();
  }

  @override
  Future<TotalSupplyResponse> getTotalSupply() async {
    var data = json.encode({"jsonrpc": "2.0", "id": 1, "method": "getSupply"});
    final response = await http.post(
        Uri.parse("https://api.mainnet-beta.solana.com"),
        headers: {'Content-Type': 'application/json'},
        body: data);
    print(">>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>${data}");
    print(">>>>>>>>>>>>>>>>${response.body}");
    if (response.statusCode == 200) {
      return TotalSupplyResponse.fromJson(jsonDecode(response.body));
    }
    throw UnimplementedError();
  }
}
