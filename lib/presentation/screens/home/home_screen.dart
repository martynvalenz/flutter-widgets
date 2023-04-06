import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder:(context, index){
        final menuItem = appMenuItems[index];
        return _CustomLIstTile(menuItem: menuItem);
      }
    );
  }
}

class _CustomLIstTile extends StatelessWidget {
  const _CustomLIstTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap:(){
        // * Una forma de trabajar la navegación
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   ),
        // );
        // * Otra forma de trabajar la navegación
        // Navigator.pushNamed(context, menuItem.link);

        // * Usando el go router
        context.push(menuItem.link);
      }
    );
  }
}