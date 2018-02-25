import 'dart:async';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final int amount;
  final int spent;
  final Color color;
  final IconData icon;

  const Category({this.name, this.amount, this.spent, this.color, this.icon});
}

abstract class CategoryRepository {
  Future<List<Category>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
