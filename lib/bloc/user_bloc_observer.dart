import 'package:flutter_bloc/flutter_bloc.dart';

class UserBlocObserver extends BlocObserver{

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
print(transition);
super.onTransition(bloc, transition);
  }
  @override
  void onClose(Cubit cubit) {
print("closed $cubit");
super.onClose(cubit);
  }
  @override
  void onCreate(Cubit cubit) {
print("created $cubit");
super.onCreate(cubit);
  }
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
print( '$cubit $error,$stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}