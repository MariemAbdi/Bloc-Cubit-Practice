import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
   on<AuthLoginEvent>(_authLogin);
   on<AuthLogoutEvent>(_authLogout);
  }

  void _authLogin(AuthLoginEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      if(!RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email)) {
        return emit(AuthFailure("Email Format Is Invalid."));
      }else if(password.length < 6){
        return emit(AuthFailure("Password Should Contain At Least 6 Characters."));
      }

      await Future.delayed(const Duration(seconds: 3), (){
        return emit(AuthSuccess(uid: "$email-$password"));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
  void _authLogout(AuthLogoutEvent event, Emitter<AuthState> emit)async{
    try {
      await Future.delayed(const Duration(seconds: 1), (){
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
