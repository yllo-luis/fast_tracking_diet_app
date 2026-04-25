import 'dart:typed_data';

import 'package:flutter/material.dart';

class LoginStore {
  final ValueNotifier<bool> isDoingLogin = ValueNotifier(false);
  final ValueNotifier<bool> isDoingRegister = ValueNotifier(false);

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController userNameRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
}