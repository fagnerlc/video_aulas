import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';

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
    return MaterialApp(
      title: 'Loja Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
