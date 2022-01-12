import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString _textoSalvo = 'Nada Salvo'.obs;

  get textoSalvo => _textoSalvo.value;
  set textoSalvo(value) => this._textoSalvo.value = value;

  salvar(String valorDigitado) async {
    //this.textoSalvo = valorDigitado;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', valorDigitado);
    print('Operação (salvar): $valorDigitado');
  }

  recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    textoSalvo = prefs.getString('nome') ?? 'Sem valor';
  }

  remover() async {
    final prefs = await SharedPreferences.getInstance();
    var prints = prefs.getString('nome');
    print('PRINT1 :$prints');
    await prefs.remove('nome');
    print('PRINT2 :$prints');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
