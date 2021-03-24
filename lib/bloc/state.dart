import 'package:equatable/equatable.dart';
import 'package:sample_api_test/model/employee.dart';

abstract class SampleState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class InitialState extends SampleState{}
class LoginSuccess extends SampleState{}
class LoginFail extends SampleState{}

class EmployeeState extends SampleState{
final List<Employee> employeeList;

EmployeeState(this.employeeList);
}