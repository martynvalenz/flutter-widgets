import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/counter_provider.dart';
import '../../providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
 static const String name = 'counter';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions:[
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ]
      ),
      body: Center(
        child: Text('Clicks: $clickCounter', style:Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // *Otra forma mas completa de editar el estado
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}