
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_api_test/bloc/bloc.dart';
import 'package:sample_api_test/bloc/event.dart';
import 'package:sample_api_test/bloc/state.dart';
import 'package:sample_api_test/model/user.dart';
import 'package:sample_api_test/ui/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [SizedBox(height: 100,),
                Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Username",
                        ),
                        controller: usernameController,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "password"),
                        controller: passwordController,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<UserBloc>(context).add(LoginEvent(
                                UserModel(usernameController.text,
                                    passwordController.text)));
                          },
                          child: Text("Login"))
                    ],
                  ),
                ),Container()
              ],
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(create: (context)=>UserBloc(InitialState()),

                      child: UserHome(),
                    )));
          }
        },
      )),
    );
  }
}
