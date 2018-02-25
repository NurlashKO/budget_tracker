import 'dart:async';
import 'category_data.dart';

class Transaction {
  final String label;
  final int amount;
  final Category category;

  const Transaction({this.label, this.amount, this.category});
}

abstract class TransactionRepository {
  Future<List<Transaction>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}