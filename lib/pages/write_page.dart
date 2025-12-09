import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/widget/custom_textfield.dart';
import 'package:note_app/widget/header.dart';

class WritePage extends StatefulWidget {
  final ListOfNote? existingNote;

  const WritePage({super.key, this.existingNote});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController noteTitleController = TextEditingController();
  final TextEditingController noteBodyController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingNote != null) {
      noteTitleController.text = widget.existingNote!.name;
      noteBodyController.text = widget.existingNote!.snippet;
    }
  }

  @override
  void dispose() {
    noteTitleController.dispose();
    noteBodyController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final title = noteTitleController.text.trim();
    final body = noteBodyController.text.trim();

    if (title.isEmpty && body.isEmpty) return;

    setState(() => _isLoading = true);

    final collection = FirebaseFirestore.instance.collection('notes');
    final data = {
      'name': title,
      'snippet': body,
      'timestamp': DateTime.now().toIso8601String(),
    };

    try {
      if (widget.existingNote == null) {
        await collection.add(data);
      } else {
        await collection.doc(widget.existingNote!.id).update(data);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        firstIcon: Icons.arrow_back,
        title: widget.existingNote == null ? "New Note" : "Edit Note",
        secondIcon: _isLoading ? null : Icons.check,
        
        onFirstIconTap: () => Navigator.pop(context),
        onSecondIconTap: _handleSave,
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Note title',
                    textEditingController: noteTitleController,
                  ),
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