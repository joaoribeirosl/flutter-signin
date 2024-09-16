import 'package:flutter/material.dart';

class EditTaskModal extends StatefulWidget {
  const EditTaskModal({super.key});

  @override
  State<EditTaskModal> createState() => _EditTaskModalState();
}

class _EditTaskModalState extends State<EditTaskModal> {
  final editTaskController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    editTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Basic dialog title'),
          content: TextField(
            controller: editTaskController,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
  }
}
