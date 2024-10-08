import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/repositories/task_respository.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/add_task_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/edit_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/get_all_tasks_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/domain/usecases/remove_task_by_id_use_case.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/datasource/add_task_datasource.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/datasource/edit_task_by_id_datasource.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/datasource/get_all_tasks_datasource.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/external/datasource/remove_task_by_id_datasource.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/add_task_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/edit_task_by_id_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/get_all_tasks_datasource_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/datasource/remove_task_by_id_use_case_interface.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/infra/repositories/task_repository.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/pages/create_task_page.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/pages/get_task_page.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/store/task_store.dart';
import 'package:http/http.dart' as http;

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.add(http.Client.new);

    i.add<IAddTaskDatasource>(AddTaskDatasource.new);
    i.add<IGetAllTasksDatasource>(GetAllTasksDatasource.new);
    i.add<IRemoveTaskByIdDatasource>(RemoveTaskByIdDatasource.new);
    i.add<IEditTaskByIdDatasource>(EditTaskByIdDatasource.new);

    i.add<ITaskRepository>(TaskRepository.new);

    i.add<IAddTaskUseCase>(AddTaskUseCase.new);
    i.add<IGetAllTasksUseCase>(GetAllTasksUseCase.new);
    i.add<IRemoveTaskByIdUseCase>(RemoveTaskByIdUseCase.new);
    i.add<IEditTaskByIdUseCase>(EditTaskByIdUseCase.new);

    i.addSingleton(TaskStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => GetTaskPage(user: r.args.data),
    );
    r.child('/create_task_page/',
        child: (context) => CreateTaskPage(user: r.args.data));
  }
}
