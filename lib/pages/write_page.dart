import 'package:flutter/material.dart';
import 'package:note_app/widget/header.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteBodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _noteTitleController.dispose();
    _noteBodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        firstIcon: Icons.arrow_back,
        title: "Edit note",
        secondIcon: Icons.check,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _noteTitleController,
              showCursor: true,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                hintText: "Note title",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                //border: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,),
                ),
              ),
            ),

            //Note body
            Expanded(
              child: TextField(
                controller: _noteBodyController,
                showCursor: true,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  labelText: "Start writing",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
