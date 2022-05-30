import 'package:fitness/models/raporlar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RaporlarState with ChangeNotifier {
  final List<Raporlar> _raporlar = [
    Raporlar(value: 65, time: DateTime.utc(2022, 10, 4)),
    Raporlar(value: 62, time: DateTime.utc(2022, 29, 4)),
    Raporlar(value: 80, time: DateTime.utc(2022, 30, 5))
  ];
  List<Raporlar> get raporlar => _raporlar;
  Raporlar get currentWeight => _raporlar.first;
  add(Raporlar raporlar) {
    _raporlar.insert(0, raporlar);
    notifyListeners();
  }
}

class HomeControl extends GetxController {
  var deger = 65.0.obs;
}
