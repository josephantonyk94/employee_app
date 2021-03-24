import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_api_test/bloc/event.dart';
import 'package:sample_api_test/bloc/state.dart';
import 'package:sample_api_test/model/employee.dart';
import 'package:sample_api_test/repository/apiclient.dart';

class SampleBloc extends Bloc<SampleEvent,SampleState>{
  SampleBloc(SampleState initialState) : super(initialState);
  int pageNo=1;
  bool isFetching=false;

  @override
  Stream<SampleState> mapEventToState(SampleEvent event) async*{
 if(event is LoginEvent){
  var result=  ApiClient().login(event.user);
  print(result);
  yield LoginSuccess();
 }
 else if(event is FetchEmployee){
yield InitialState();
     Response result= await ApiClient().fetchEmployees(pageNo<3?pageNo:2);
     pageNo++;
     print(result.data);
     EmployeeResponse employeeResponse=EmployeeResponse.fromJson(result.data);
     print(employeeResponse);
     List<Employee> employeeList=employeeResponse.data;
     print(employeeList);
     yield EmployeeState(employeeList);
   }

 }
  }
  
