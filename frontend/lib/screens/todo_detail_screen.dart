import 'package:flutter/material.dart';

class TodoDetailScreen extends StatefulWidget {
  final String? id;
  const TodoDetailScreen({super.key, this.id});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('TodoDetailScreen is working'),
      ),
    );
  }
}
