import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_textfield.dart';
import 'package:note_app/widget/header.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController noteTitleController = TextEditingController();
  final TextEditingController noteBodyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    noteTitleController.dispose();
    noteBodyController.dispose();
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
            CustomTextField(
              label: 'Note title',
              textEditingController: noteTitleController,
            ),

            //Note body
            Expanded(
              child: CustomTextField(
                label: "Start writing ...",
                textEditingController: noteBodyController,
                maxLines: null,
                showUnderline: false,
                fontSize: 16,
                fontWeight: FontWeight.normal,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
