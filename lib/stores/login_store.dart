import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  bool isloading = false;

  @observable
  bool isObscure = true;

  @observable
  String email = "";
  
  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @action
  void setObscure() => isObscure = !isObscure;

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6;

  @computed
  Function get loginPressed => 
    (isFormValid && !isloading) ? login : null;

  @action
  Future<void> login() async {
    isloading = true;
    await Future.delayed(Duration(seconds: 2));
    isloading = false;

    loggedIn = true;

    email = '';
    password = '';
  }
  
  @action
  void logout() {
    loggedIn = false;
  }
}