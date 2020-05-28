
import 'package:loginPage/data/restdata.dart';
import 'package:loginPage/modal/user.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

  doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError.toString()));
  }
}

