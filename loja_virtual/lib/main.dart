import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/login/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());

/** Gravando no Firebase */
  //Firestore.instance.collection('teste').add({'teste': 'teste'});

  // com o add o firebase preenche automatico o documento
  //Firestore.instance.collection('pedidos').add(
  //  {'preco': 199.99, 'usuario': 'Fagner'},
  //);

  // com o document + setData eu coloco o identificador do documento
  //Firestore.instance.collection('pedidos').document('#0001').setData(
  //  {'preco': 199.99, 'usuario': 'Fagner Lopes'},
  //);

  /** Lendo no Firebase */

  //DocumentSnapshot document = await Firestore.instance
  //    .collection('usuarios')
  //    .document('ksjlhrwk4j4434k32j42hkj')
  //    .get();
  //debugPrint(document.data['nome'] + document.data['sobrenome']);

  // snapshot + listen lê em tempo real
  //Firestore.instance
  //    .collection('usuarios')
  //    .document('ksjlhrwk4j4434k32j42hkj')
  //    .snapshots()
  //    .listen((document) {
  //  print(document.data);
  //});

  // Instance of para destrinchar
  //QuerySnapshot snapshot =
  //    await Firestore.instance.collection('boletos').getDocuments();
  //print(snapshot.documents);
  //for (DocumentSnapshot document in snapshot.documents) {
  //  print(document.data);
  //}

  //Firestore.instance.collection('boletos').snapshots().listen((snapshot) {
  //  for (DocumentSnapshot document in snapshot.documents) {
  //    print(document.data);
  //  }
  //});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      // lazy lê o objeto instataneamente
      lazy: false,
      child: MaterialApp(
        title: 'Loja Virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 7,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: BaseScreen(),
        //onGenerateRoute: (settings),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
              break;
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
