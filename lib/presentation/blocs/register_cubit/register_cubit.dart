import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app_cubit_bloc/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());

  void onSubmit() {
    print('cubit submit: $state');
    //como el username ya fue poteado con o sin data ya no es pure
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      email: Email.dirty(state.email.value),
      isValid: Formz.validate([
        state.username,
        state.password,
        state.email
        //TODO: email
      ]),
    ));
  }

  void usernameChanged(String value) {
    //para hacer el copywith debemos hacer una instancia de la clase pero sucia con el valor que le este mandando
    final username = Username.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.password,
          state.email
        ]) //el formz pide el listado de campos tipo formzinput y manda a llama rla vilidacion de cada uno
        ));
  }

  void emailChange(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.username])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username, state.email])));
  }
}
