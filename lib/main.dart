import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  var items = new List<Item>();

  // construtor:
  HomePage() {
    items = [];
    // items.add(Item(title: "Tarefa 1", done: false));
    // items.add(Item(title: "Tarefa 2", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var editText = TextEditingController();

  void addTask() {
    if (editText.text.isEmpty) return;
    setState(() {
      widget.items.add(
        Item(
          title: editText.text,
          done: false,
        ),
      );
      editText.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: editText,
          keyboardType: TextInputType.text, // teclado
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Digite uma nova tarefa",
            labelStyle: TextStyle(color: Colors.white60),
          ),
        ),
        
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index){
          final item = widget.items[index]; // constant
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done, // concluído ou não
            onChanged: (value) {
              setState(() {
               item.done = value; 
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
      );
  }
}
