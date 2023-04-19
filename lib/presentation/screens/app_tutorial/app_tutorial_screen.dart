import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida que te gusta',
    'lorem ipsum dolor sit amet',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'lorem ipsum dolor sit amet',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta de tu comida',
    'Anim culpa nisi anim deserunt est cupidatat.',
    'assets/images/3.png',
  ),
];

class AppTurorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTurorialScreen({super.key});

  @override
  State<AppTurorialScreen> createState() => _AppTurorialScreenState();
}

class _AppTurorialScreenState extends State<AppTurorialScreen> {
  final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList()
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            )
          ),
          endReached ? Positioned(
            bottom:30,
            right:30,
            child:FadeInRight(
              from:15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                child:const Text('Comenzar'),
                onPressed: () => context.pop()
              ),
            )
          ):const SizedBox.shrink()
        ],
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl}
  );

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}