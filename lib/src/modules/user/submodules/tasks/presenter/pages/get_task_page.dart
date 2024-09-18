import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/pages/components/edit_task_modal.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/pages/components/task_toast_manager.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/store/task_store.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GetTaskPage extends StatefulWidget {
  final User? user;
  const GetTaskPage({super.key, required this.user});

  @override
  State<GetTaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<GetTaskPage> {
  late final TaskStore taskStore;

  @override
  void initState() {
    super.initState();
    taskStore = context.read<TaskStore>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskStore.getAllTasks(widget.user!.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              '${taskStore.shortenedName(widget.user!.name)}\'s Task List:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) => Expanded(
                child: ListView.builder(
                  itemCount: taskStore.taskList.length,
                  itemBuilder: (context, index) {
                    final actualTask = taskStore.taskList[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          duration: const Duration(seconds: 1),
                          child: Card(
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xffac255e),
                                  Color(0xffca485c),
                                  Color(0xffe16b5c),
                                  Color(0xfff39060),
                                  Color(0xffffb56b),
                                ],
                              )),
                              child: ListTile(
                                title: Text(actualTask.task),
                                textColor: Colors.white,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => EditTaskModal(
                                            newText: actualTask.task,
                                            onEdit: (p0) async {
                                              await taskStore.editTaskById(
                                                  p0, actualTask);
                                              await taskStore.getAllTasks(widget
                                                  .user!
                                                  .id); // TODO update screen w/o this get
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        await taskStore
                                            .removeTaskById(actualTask.id);

                                        TaskToastManager.showToast(
                                            'Task removed successfully!',
                                            context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
