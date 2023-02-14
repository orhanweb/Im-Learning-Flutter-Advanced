import 'package:flutter/material.dart';

class NetworkChangeExampleView extends StatefulWidget {
  const NetworkChangeExampleView({super.key});

  @override
  State<NetworkChangeExampleView> createState() =>
      _NetworkChangeExampleViewState();
}

class _NetworkChangeExampleViewState extends State<NetworkChangeExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Network Change Page"),
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Cloud"),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
      ],
    );
  }
}
