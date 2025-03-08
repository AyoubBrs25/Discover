import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  Settings({required this.data});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
