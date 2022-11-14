import 'dart:convert';

import 'package:flutter_phantom_demo/models/balance_response.dart';
import 'package:flutter_phantom_demo/models/largest_account_response.dart';
import 'package:http/http.dart' as http;

abstract class AccountRepo {
  Future<BalanceResponse> getBalance({required String pubKey});
  Future<largetsAccountResponse> getLargestAccount();
}

class AccountIMPL extends AccountRepo {
  @override
  Future<BalanceResponse> getBalance({required String pubKey}) async {
    var data = json.encode({
      "jsonrpc": "2.0",
      "id": 1,
      "method": "getBalance",
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
    final response = await http.post(Uri.parse("https://api.devnet.solana.com"),
        headers: {'Content-Type': 'application/json'}, body: data);
    print(">>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>${data}");
    print(">>>>>>>>>>>>>>>>${response.body}");
    if (response.statusCode == 200) {
      return largetsAccountResponse.fromJson(jsonDecode(response.body));
    }
    throw UnimplementedError();
  }
}
