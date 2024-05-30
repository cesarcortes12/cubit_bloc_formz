part of 'counter_cubit.dart';

class CounterState extends Equatable {
  //equatable nos soluciona el problema de que un estado se cree aun siendo el mismo anterior
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  copyWith({
    int? counter, 
    int? transactionCount
    }) => CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object?> get props => [
        counter,
        transactionCount
      ]; //son los prop que se le envian al equatanble par aqu eeste pendiente de esos
}
