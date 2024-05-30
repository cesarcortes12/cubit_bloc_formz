import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app_cubit_bloc/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
//el blocprovider envuelve toda la vista para que todo tenga acceso al cubit
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //con esto vamos a escucha rlos cambios que tiene el state
    //final counterState = context.watch<CounterCubit>().state; //con esto instancias para que este pendiente de los cambios
    final counterCubit = context.read<
        CounterCubit>(); //con esto leermos el cubit para tener acceso a sus metodos

    return Scaffold(
      appBar: AppBar(
        //ESTA ES OTRA MANERA SIMILAR AL BLOCBUILDER el contextr select me da accceso a todo el cubit
        //este es tambien un watch solo esta pendiente de esto
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () => {counterCubit.reset()},
              icon: Icon(Icons.refresh_outlined)),
        ],
      ),
      body: Center(
        // al envolver el Text en un BlocBuilder el widget se renderiza solo cuando cambia el estado
        child: BlocBuilder<CounterCubit, CounterState>(
          //podrimaos tener la opcio nde cambiarlo solo cuando el counter cambie con el buildwhen
          //buildWhen: (previus, current) => previus.counter != current.counter,
          builder: (context, state) {
            print('counter cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Text('+3'),
            onPressed: () => {counterCubit.increaseBy(3)},
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: Text('+2'),
            onPressed: () => {counterCubit.increaseBy(2)},
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: Text('+1'),
            onPressed: () => {counterCubit.increaseBy(1)},
          )
        ],
      ),
    );
  }
}
