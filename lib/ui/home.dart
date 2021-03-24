import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_api_test/bloc/bloc.dart';
import 'package:sample_api_test/bloc/event.dart';
import 'package:sample_api_test/bloc/state.dart';
import 'package:sample_api_test/model/employee.dart';
import 'package:sample_api_test/ui/employee_card.dart';

class EmployeeHome extends StatefulWidget {
  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  List<Employee> employeeList=[];

  ScrollController scrollController;
  @override
  void initState() {
BlocProvider.of<SampleBloc>(context).add(FetchEmployee());
scrollController=ScrollController();
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BlocBuilder<SampleBloc,SampleState>(builder:(context,state){
      if(state is EmployeeState) {
        employeeList.addAll(state.employeeList);

        return Container(
              child: ListView.builder(
                  controller: scrollController
                    ..addListener(() {
                      if (scrollController.offset ==
                              scrollController.position.maxScrollExtent &&
                          !context.read<SampleBloc>().isFetching) {
                        context.read<SampleBloc>()
                          ..isFetching = true
                          ..add(FetchEmployee());
                      }
                    }),
                  itemCount: employeeList.length,
                  itemBuilder: (context, index) {
                    print(employeeList.length);
                    return EmployeeCard(
                        employeeList[index].firstName,
                        employeeList[index].lastName,
                        employeeList[index].email,
                        employeeList[index].avatar);
                  }),
            );
          } else return Center(child: CircularProgressIndicator());
    },
    )),);
  }
}
