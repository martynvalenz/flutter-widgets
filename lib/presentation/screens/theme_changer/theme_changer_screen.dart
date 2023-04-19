import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = '/theme_changer';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions:[
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode
            ),
            onPressed: () {
              // * Una forma senncilla de editar el estado
              // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              // *Otra forma mas completa de editar el estado a través del Theme Notifier
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ]
      ),
      body: const _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder:(context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged:(value){
            // * Una forma senncilla de editar el estado
            // ref.read(selectedColorProvider.notifier).state = index;
            // *Otra forma mas completa de editar el estado a través del Theme Notifier
            ref.read(themeNotifierProvider.notifier).changeColor(index);
          }
        );
      },
    );
  }
}