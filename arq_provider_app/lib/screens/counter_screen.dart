import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';


class CounterScreen extends StatelessWidget {

  const CounterScreen({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Text(
                  'Counter: ${counterProvider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  tooltip: 'Increment',
                  heroTag: null,
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  tooltip: 'Decrement',
                  heroTag: null,
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ) 
      ),
    );
  }

}