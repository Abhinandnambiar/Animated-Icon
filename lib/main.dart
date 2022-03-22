import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controlle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controlle =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  bool _animated = false;
  void click() {
    _animated = !_animated;
    _animated == false ? _controlle.forward() : _controlle.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icon'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: click,
          child: AnimatedIcon(
            progress: _controlle,
            size: 150,
            color: Colors.green,
            icon: AnimatedIcons.play_pause,
          ),
        ),
      ),
    );
  }
}
