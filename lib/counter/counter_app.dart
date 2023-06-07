import 'package:flutter/material.dart';
import 'package:board_games_flutter/routes.dart';



final counnterProvider = StateProvider<int>((_) => 0);
class CounterApp extends ConsumerStatefulWidget {
  CounterApp({super.key,});

  @override
  ConsumerState<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends ConsumerState<CounterApp> {
  void _incrementCounter() {
    ref.read(counnterProvider.notifier).state++;
  }

  void _decrementCounter() {
    ref.read(counnterProvider.notifier).state--;
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counnterProvider);
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Counter app'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current count is:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
