import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'Buttons';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child:Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('ElevatedButton icon')),
            FilledButton(
              onPressed: () {},
              child: const Text('FilledButton'),
            ),
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.accessibility_new),
              label: const Text('FilledButton icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon:const Icon(Icons.terminal),
              label: const Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.text_fields),
              label: const Text('TextButton'),
            ),
            const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color.primary),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style:TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}