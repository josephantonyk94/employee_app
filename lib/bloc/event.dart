import 'package:sample_api_test/model/user.dart';

abstract class SampleEvent{}
class LoginEvent extends SampleEvent{

UserModel user;
  LoginEvent(this.user);
}
class FetchEmployee extends SampleEvent{
}