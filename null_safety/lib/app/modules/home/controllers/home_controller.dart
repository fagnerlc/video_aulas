import 'package:get/get.dart';

class HomeController extends GetxController {
  bad(String suaString) {
    print(suaString.length);
  }

  calcula() {
    print(7 + 7);
  }

  calculaNum(int x) {
    print(x + x);
  }

  stringNaoNula(String okString) {
    print(okString.length);
  }

  RxString? nome;
  final RxInt count = 0.obs;
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
