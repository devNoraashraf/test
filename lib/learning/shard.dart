import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shard extends StatefulWidget {
  const Shard({super.key});

  @override
  State<Shard> createState() => _ShardState();
}

class _ShardState extends State<Shard> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString("name", "nora");
            },
            child: Text("data"),
          ),
          MaterialButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.getString("name");
            },
            child: Text("nora"),
          ),
        ],
      ),
    );
  }
}
