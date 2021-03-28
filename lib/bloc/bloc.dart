import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_api_test/bloc/event.dart';
import 'package:sample_api_test/bloc/state.dart';
import 'package:sample_api_test/model/profile.dart';
import 'package:sample_api_test/repository/apiclient.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc(UserState initialState) : super(initialState);
  int pageNo=7;
  bool isFetching=false;
  List<Profile> userList=[];
  bool isReachedMax=false;


//   @override
//   void onEvent(UserEvent event) {
// print(event.runtimeType);
// super.onEvent(event);
//   }
// @override
//   void onTransition(Transition<UserEvent, UserState> transition) {
// print(transition);
// super.onTransition(transition);
//   }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
var currentState=state;
if(currentState is FetchedUserState){
  currentState..props;
}
 if(event is LoginEvent){
  yield LoginSuccess();
 }
 else if(event is FetchUsers){

     Response response= await ApiClient().fetchUser(pageNo);

   var userList1=(response.data as List).map((e) => Profile.fromJson(e)).toList();
if(userList1.length<1){
  isReachedMax=true;
}
   userList=userList+userList1;
   print("in bloc page $pageNo $isReachedMax ${userList.length}");
   pageNo++;
      yield FetchedUserState(userList,isReachedMax);
      isFetching=false;
   }

 }
  }
  
