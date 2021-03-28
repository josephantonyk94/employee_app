import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_api_test/bloc/bloc.dart';
import 'package:sample_api_test/bloc/event.dart';
import 'package:sample_api_test/bloc/state.dart';
import 'package:sample_api_test/model/profile.dart';
import 'package:sample_api_test/ui/bottom_loading_card.dart';
import 'package:sample_api_test/ui/user_card.dart';

class UserHome extends StatelessWidget {
   List<Profile> userList=[];

  ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(FetchUsers());
    return Scaffold(body: SafeArea(child: BlocBuilder<UserBloc,UserState>(builder:(context,state){
      if(state is FetchedUserState) {
        userList=state.userList;
        print("in home ui ${userList.length}");

        return ListView.builder(
            controller: scrollController
              ..addListener(() {
                if (scrollController.offset ==
                        scrollController.position.maxScrollExtent &&
                    !context.read<UserBloc>().isFetching&&context.read<UserBloc>().isReachedMax==false) {
                  context.read<UserBloc>()
                    ..isFetching = true
                    ..add(FetchUsers());
                }
              }),
            itemCount:state.isReachedMax?userList.length: userList.length+1,
            itemBuilder: (context, index) {
              print(index);
              return index>=userList.length?BottomLoadingCard(): UserCard(
                  userList[index].title,
                  userList[index].body,
                  userList[index].id.toString(),
                  "https://cdn130.picsart.com/233347033055202.jpg");
            });
          }
      else return  Center(child: CircularProgressIndicator());
        },
    )),);
  }
}
