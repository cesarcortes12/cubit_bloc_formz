import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app_cubit_bloc/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app_cubit_bloc/presentation/widgets/inputs/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          FlutterLogo(size: 100),
          _RegisterForm(),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //al tener las validaciones enlazadas desde el gestor de estado no necesitamos el key
  @override
  Widget build(BuildContext context) {
    final registerCubit =
        context.watch<RegisterCubit>(); //instanciamos el cubit
    final username =
        registerCubit.state.username; //accedemos al estado de username
    final password =
        registerCubit.state.password; //accedemos al estado de username
    //final username = registerCubit.state.username; //accedemos al estado de username
    final email = registerCubit.state.email;

    return Form(
        //key: _formKey,
        child: Column(children: [
      CustomTextFormField(
        label: 'Nombre de usuario',
        onChanged:
            registerCubit.usernameChanged, //cada cambio se le envia el valor
        //_formKey.currentState?.validate(); //cada renderizado se valida
        errorMessage:
            //validamos si el campo ha sido o no modificado y es o n ovalido
            username.errorMessage,
      ),
      SizedBox(height: 10),
      CustomTextFormField(
          label: 'Email',
          onChanged: registerCubit.emailChange,
          errorMessage: email.errorMessage),
      SizedBox(height: 10),
      CustomTextFormField(
          label: 'password',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage),
      const SizedBox(height: 20),
      FilledButton.tonalIcon(
          onPressed: () {
            //si el onpresed pone en null el boton se deshabilita
            /*final isValid = _formKey.currentState!
                    .validate(); //con esto vigilamos los capos del formulario
                if (!isValid) return;*/
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear Usuario'))
    ]));
  }
}
