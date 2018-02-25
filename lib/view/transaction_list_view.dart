import 'package:flutter/material.dart';
import '../data/transaction_data.dart';
import 'presenter/transaction_presenter.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key key}):super(key: key);

  @override
  _TransactionListState createState() => new _TransactionListState();
}


class _TransactionListState extends State<TransactionList>
                            implements TransactionListViewContract {
  TransactionListPresenter _presenter;
  List<Transaction> _transacions;
  bool _IsSearching;

  _TransactionListState() {
    _presenter = new TransactionListPresenter(this);
  }

  void refreshList() {
    _IsSearching = true;
    _presenter.loadTransactions();
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = true;
    _presenter.loadTransactions();
  }

  void onLoadTransactionsError() {
    // TODO(nurlashko): handle error.
  }

  void onLoadTransactionsComplete(List<Transaction> transactions) {
    setState(() {
      _transacions = transactions;
      _IsSearching = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (_IsSearching) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()
          )
      );
    } else {
      widget = new Material(
          child: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _buildTransactionList()
      ));
    }
    return widget;
  }

  List<_TransactionListItem> _buildTransactionList() {
    return _transacions.map((transaction) =>
        new _TransactionListItem(transaction)
    ).toList();
  }
}

class _TransactionListItem extends ListTile {
  _TransactionListItem(Transaction item):
    super(
          leading: new Icon(item.category.icon, color: item.category.color),
          title: new Text((item.amount > 0 ? "+":"") + item.amount.toString()),
          subtitle: new Text(item.label),
    );
}
