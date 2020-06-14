import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
//import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:io';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); / se quiser travar a orientação do app
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor:
            Colors.tealAccent[400], //Colors.brown//Colors.tealAccent[400]
        //fontFamily: 'Raleway',
        //fontFamily: 'OpenSans',
        //fontFamily: 'Quicksand',

        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.teal[50],
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
        accentTextTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
              button: TextStyle(
                color: Colors.teal[50],
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Adubos e insumos',
      descricao: 'Adubos para plantação de café',
      value: 500,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't1',
      title: 'Ração para Cavalos',
      descricao: 'Ração com vitaminas',
      value: 700,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't2',
      title: 'Ração para Galinhas',
      descricao: 'Ração com vitaminas',
      value: 200,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't3',
      title: 'Ração para Peixes',
      descricao: 'Ração de engorda',
      value: 150,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't4',
      title: 'Vitaminas para gado de leite',
      descricao: 'Engorada rápida',
      value: 250,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't5',
      title: 'Vitaminas para gado de corte',
      descricao: 'Engorada rápida',
      value: 250,
      date: DateTime.now().subtract(Duration(days: 9)),
    ),
    Transaction(
      id: 't6',
      title: 'Arreios para cavalos',
      descricao: 'Cela, cabresto, bacheiro',
      value: 750,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't7',
      title: 'Adubos e insumos',
      descricao: 'Adubos para plantação de café',
      value: 300,
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    //return _transactions.where((tr) => tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, String descricao, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      descricao: descricao,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context)
        .pop(); // fecha o modal após digitar as informações necessárias (Descrição e Valor)
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  // Recebe um context e chama o transactionForm
  _openTransactionFormMotal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  Widget _getIconButton(IconData icon, Function fn) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: fn,
            child: Icon(icon),
          )
        : IconButton(
            icon: Icon(icon),
            onPressed: fn,
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart ? iconList : chartList,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormMotal(context),
      ),
    ];

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Despesas Pessoais',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          )
        : AppBar(
            title: Text(
              'Despesas Pessoais',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: actions,
          );

    final alturaDisponivel = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Exibir gráfico'),
                  Switch.adaptive(
                      activeColor: Theme.of(context).accentColor,
                      value: _showChart,
                      onChanged: (value) {
                        setState(() {
                          _showChart = value;
                        });
                      }),
                ],
              ),
            if (_showChart || !isLandscape)
              Container(
                  height: alturaDisponivel * (isLandscape ? 0.7 : 0.30),
                  child: Chart(_recentTransactions)),
            if (!_showChart || !isLandscape)
              Container(
                height: alturaDisponivel * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                  _transactions,
                  _removeTransaction,
                ),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _openTransactionFormMotal(context),
                    child: Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
