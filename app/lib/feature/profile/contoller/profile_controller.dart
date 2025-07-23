import 'package:app/feature/profile/data/user_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileController extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? newUser) {
    _user = newUser;
    notifyListeners();
  }
}
