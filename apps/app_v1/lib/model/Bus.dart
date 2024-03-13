
import 'Driver.dart';

class Bus {
  String _id;
  Driver _driver;
  String _plateNo;
  int _capacity;

  Bus({
    required String id,
    required Driver driver,
    required String plateNo,
    required int capacity,
  })   : _id = id,
        _driver = driver,
        _plateNo = plateNo,
        _capacity = capacity;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Driver get driver => _driver;

  set driver(Driver value) {
    _driver = value;
  }

  String get plateNo => _plateNo;

  set plateNo(String value) {
    _plateNo = value;
  }

  int get capacity => _capacity;

  set capacity(int value) {
    _capacity = value;
  }
}
