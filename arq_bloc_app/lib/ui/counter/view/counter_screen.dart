import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';


class CounterScreen extends StatelessWidget {

  const CounterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Bloc'),
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );          
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  tooltip: 'Increment',
                  heroTag: null,
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment),
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  tooltip: 'Decrement',
                  heroTag: null,
                  onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}