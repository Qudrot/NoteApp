import 'package:flutter/material.dart';
import 'package:note_app/widget/header.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        firstIcon: Icons.arrow_back,
        title: "Edit note",
        secondIcon: Icons.check,
      ),

      body: Column(

      ),
    );
  }
}
