import 'package:flutter/material.dart';

class EditTaskModal extends StatefulWidget {
  final String taskText;
  final Function(String) onEdit;
  const EditTaskModal(
      {super.key, required this.taskText, required this.onEdit});

  @override
  State<EditTaskModal> createState() => _EditTaskModalState();
}

class _EditTaskModalState extends State<EditTaskModal> {
  final editTaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editTaskController.text = widget.taskText;
  }

  @override
  void dispose() {
    editTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('edit task:'),
      content: TextField(
        controller: editTaskController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('confirm'),
          onPressed: () {
            widget.onEdit(editTaskController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
