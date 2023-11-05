import 'package:flutter/material.dart';
import 'package:multi_provider_example/controller/counting_the_number.dart';
import 'package:multi_provider_example/model/provider/first_model_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    /// MyHomePage is rebuilt when counter changes

    final counter = Provider.of<CountingTheNumber>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            //consumer or selector
            Text(
              counter.value.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => counter.increaseValue(),
                  child: const Text(
                    'Increase',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () => counter.decreaseValue(),
                  child: const Text(
                    'Decrease',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red,
                  child: Consumer<FirstModelProvider>(
                    builder: (context, firstModelProvider, child) =>
                        ElevatedButton(
                      onPressed: () {
                        firstModelProvider.supplyFirstData();
                      },
                      child: const Text(
                        'Press me!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white30,
                  child: Consumer<FirstModelProvider>(
                    builder: (context, firstModelProvider, child) => Text(
                      firstModelProvider.someDate,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red[200],
                  child: Consumer<FirstModelProvider>(
                    builder: (context, firstModelProvider, child) =>
                        ElevatedButton(
                      onPressed: () {
                        firstModelProvider.clearData();
                        counter.resetValue();
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
