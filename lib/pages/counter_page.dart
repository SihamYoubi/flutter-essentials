import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = Provider.of<CounterState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Compteur")),
      body: Center(
        child: Consumer<CounterState>(
          builder: (context, cs, _) {
            return Text('Valeur du compteur : ${cs.counter}',
                style: const TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () => counterState.decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () => counterState.increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
