import 'package:flutter/material.dart';
import 'package:impeller_mini/renderer/object_3d.dart';
import 'package:impeller_mini/renderer/view_3d.dart';
import 'package:vector_math/vector_math_64.dart' as vec;

void main() {
  runApp(const ImpellerMini());
}

class ImpellerMini extends StatelessWidget {
  const ImpellerMini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impeller Mini',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffea1f25),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final cube = Object3D(
  points: [
    vec.Vector3(0, 0, 0),
    vec.Vector3(0, 0, 1),
    vec.Vector3(0, 1, 0),
    vec.Vector3(0, 1, 1),
    vec.Vector3(1, 0, 0),
    vec.Vector3(1, 0, 1),
    vec.Vector3(1, 1, 0),
    vec.Vector3(1, 1, 1),
  ],
);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1616),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('3D View'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: SizedBox.expand(
            child: View3D(
              object3d: cube,
            ),
          ),
        ),
      ),
    );
  }
}
