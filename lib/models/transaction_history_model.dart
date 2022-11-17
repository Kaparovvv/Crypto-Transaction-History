class TransactionHistoryModel {
  TransactionHistoryModel({
    this.results,
  });

  List<Result>? results;
}

class Result {
  Result({
    this.date,
    this.listTransaction,
  });

  String? date;
  List<ListTransaction>? listTransaction;
}

class ListTransaction {
  ListTransaction({
    this.isBuy = false,
    this.name,
    this.date,
    this.dot,
    this.usd,
  });

  bool isBuy;
  String? name;
  String? date;
  String? dot;
  String? usd;
}
