import 'package:flutter/material.dart';
import 'package:note_app/db.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        actionsPadding: EdgeInsets.only(right: 16),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("My Notes", style: TextStyle(color: Colors.white),),
        actions: [
          Spacer(),
          Icon(Icons.search),
          SizedBox(width: 8,),
          Icon(Icons.menu)
        ],
      ),
      body: ListView.builder(
        itemCount: NOTES.length,
        itemBuilder: (context, index) {
          final noteList = NOTES[index];
              if(NOTES.isEmpty){
              Text("No note");
      } else{
          return ListTile(
            title: Text(noteList.name),
            subtitle: Text(noteList.snippet),
            trailing: Icon(Icons.delete),
          );
        
    
    
        }
        },
    
      ),
      floatingActionButton: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
    );
  }
}