import 'package:get/get.dart';

class DialogeClass extends GetxController {
  RxString weight = ''.obs;
  RxString price = ''.obs;
  RxDouble totalPrice = 1.0.obs;

  void getTotalPrice(String w,String p) {
    weight.value = w;
    price.value = p;
    totalPrice.value=(double.parse(w)*double.parse(p));
  }
}