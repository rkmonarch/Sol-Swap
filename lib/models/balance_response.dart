class BalanceResponse {
  String? jsonrpc;
  Result? result;
  int? id;

  BalanceResponse({this.jsonrpc, this.result, this.id});

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Result {
  Context? context;
  int? value;

  Result({this.context, this.value});

  Result.fromJson(Map<String, dynamic> json) {
    context =
        json['context'] != null ? new Context.fromJson(json['context']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    data['value'] = this.value;
    return data;
  }
}

class Context {
  int? slot;

  Context({this.slot});

  Context.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    return data;
  }
}
