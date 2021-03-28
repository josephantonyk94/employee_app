import 'package:equatable/equatable.dart';
import 'package:sample_api_test/model/profile.dart';

abstract class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class InitialState extends UserState{}
class LoginSuccess extends UserState{}
class LoginFail extends UserState{}

class FetchedUserState extends UserState{
final List<Profile> userList;
final bool isReachedMax;

FetchedUserState(this.userList,this.isReachedMax);

@override
  List<Object> get props {
return[userList,isReachedMax];
  }
}