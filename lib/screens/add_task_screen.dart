import 'package:flutter/material.dart';
import 'package:todo/blocs/bloc_exports.dart';
import 'package:todo/services/guid_gen.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titileController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titileController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                    title: titileController.text,
                    description: descriptionController.text,
                    id: GUIDGen.generate(),
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
