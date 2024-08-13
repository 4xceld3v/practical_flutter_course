import '../viewmodel/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CounterView extends StatelessWidget {

  const CounterView({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with MVVM'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterViewModel>(
              builder: (context, counterProvider, child) {
                return Text(
                  'Counter: ${context.watch<CounterViewModel>().count}',
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
                    Provider.of<CounterViewModel>(context, listen: false).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  tooltip: 'Decrement',
                  heroTag: null,
                  onPressed: () {
                    Provider.of<CounterViewModel>(context, listen: false).decrement();
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