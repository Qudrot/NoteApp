import 'package:flutter/material.dart';
import 'package:note_app/db.dart';
import 'package:note_app/pages/write_page.dart';
import 'package:note_app/widget/header.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "My Notes",
        secondIcon: Icons.search,
        thirdIcon: Icons.menu,
      ),

      body: NOTES.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.note_alt_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    "No notes yet. Tap the + button to create one!",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: NOTES.length,
              itemBuilder: (context, index) {
                final note = NOTES[index];
                return ListTile(
                  title: Text(
                    note.name,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  subtitle: Text(
                    note.snippet,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Icon(Icons.delete),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => WritePage()));
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 24),
      ),
    );
  }
}
