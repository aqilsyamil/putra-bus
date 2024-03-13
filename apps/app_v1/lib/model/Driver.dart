import 'dart:io';
import 'User.dart';

class Driver extends User {
  String _fullName;
  String _password;
  String _phoneNo;
  String _photoPath;

  // Constructor
  Driver({
         required super.id,
         required String fullName,
         required String phoneNo,
         required String password,
         super.coordinate,
         required String photoPath
  })
      : _fullName = fullName,
        _phoneNo = phoneNo,
        _password = password,
        _photoPath = photoPath;

  bool _checkImagePathExist(String imagePath) {
    File imageFile = File(imagePath);
    return imageFile.existsSync();
  }

  // Getter for full name
  String get fullName => _fullName;

  // Setter for full name
  set fullName(String value) {
    _fullName = value;
  }

  // Getter for phone number
  String get phoneNo => _phoneNo;

  // Setter for phone number
  set phoneNo(String value) {
    _phoneNo = value;
  }

  // Getter for password
  String get password => _password;

  // Setter for password
  set password(String value) {
    _password = value;
  }
  // Getter for driver photo
  String get photoPath {

    if (!_checkImagePathExist(_photoPath)) {
      return 'assets/images/default.jpg';
    }

    return _photoPath;
  }
    // Setter for driver photo
    set photoPath(String value) {
      _photoPath = value;
      if (!_checkImagePathExist(_photoPath)) {
        _photoPath = 'assets/images/default.jpg';
      }
    }
}
