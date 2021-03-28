import 'package:sample_api_test/model/user.dart';

abstract class UserEvent{}
class LoginEvent extends UserEvent{

UserModel user;
  LoginEvent(this.user);
}
class FetchUsers extends UserEvent{
}