import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnacbarScreen extends StatelessWidget {
  static const String name = 'snacbar_screen';
  const SnacbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola, soy un SnackBar'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Título de diálogo'),
          content: const Text('Magna voluptate reprehenderit Lorem irure anim dolore adipisicing non. Et quis velit irure et pariatur consectetur ea amet incididunt culpa. Proident enim irure dolor tempor labore. Consectetur aliqua voluptate laborum sunt irure cupidatat esse non nostrud consectetur irure. Eiusmod aliqua irure deserunt laboris veniam ut anim tempor elit sit aliqua labore deserunt.'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text('Aceptar'),
              onPressed: () => context.pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child:const Text('Licencias suadas'),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Pariatur adipisicing aliquip ex sunt. Ut officia non occaecat adipisicing ullamco adipisicing fugiat laborum laboris. Duis do laboris ut labore veniam ipsum anim id cupidatat qui ad est. Consectetur exercitation veniam excepteur labore enim consectetur cupidatat mollit.'),
                  ],
                );
              },
            ),
            FilledButton.tonal(
              child:const Text('Mostrar diálogo de pantalla'),
              onPressed: () {
                openDialog(context);
              },
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label:const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}