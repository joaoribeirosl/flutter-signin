import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/store/task_store.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskStore taskStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo ivson'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Tasks'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adicionar uma nova task',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Adicionar Task'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ListTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
