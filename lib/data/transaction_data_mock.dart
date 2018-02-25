import 'dart:async';
import 'transaction_data.dart';
import 'category_data.dart';
import 'package:flutter/material.dart';

class MockTransactionRepository extends TransactionRepository {

  Future<List<Transaction>> fetch() {
    return new Future.value(kTransactions);
  }
}

var kTransactions = <Transaction>[
  const Transaction(
      label: "first",
      amount: 10,
      category: const Category(amount: 100, spent: 10, color: Colors.green, icon: Icons.add_shopping_cart)),
];
