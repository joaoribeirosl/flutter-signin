# flutter-signin

This Flutter project was developed as a technical assessment for residents selected to work on the front-end of projects within the UFPE's CIn/Softex postgraduate program. The goal is to evaluate the skills of the team members in Flutter development.

## Architecture and Libraries

This project follows the Clean Architecture principles, ensuring a clear separation of concerns and maintainability. The structure of the project is modular, allowing for scalable and easily testable code. 

### Key Technologies Used:
- **Clean Dart**
- **Flutter Modular**
- **MobX**

### versions
- Flutter 3.22.3
- Dart 3.4.4
- DevTools 2.34.3
- protoc-24.1-win64.


## Backend Repository
https://github.com/jefferson-norberto2/api_tasks

## updates in API

- in register_routes(self) method add this: 
```py
self._app.add_url_rule('/remove_task_by_id', 'remove_task_by_id', self.remove_task_by_id, methods=['DELETE'])

self._app.add_url_rule('/edit_task_by_id', 'edit_task_by_id', self.edit_task_by_id, methods=['PUT'])
```

- in get_tasks(self) method change the query to:
```py
query = f'''
            SELECT * FROM {TASK_TABLE_NAME}
            WHERE {USER}={id}
            ORDER BY id DESC
        '''
```
- add this method to remove a specific task:

```py
def remove_task_by_id(self):
        id = request.headers.get('id')
        id = int(id)  

        database = Database(DATABASE_PATH)

        query = f'''
            DELETE FROM {TASK_TABLE_NAME}
            WHERE id={id}
        '''

        task = database.fetch_all(query)
        
        self.total_tasks -= 1

        self.socketio.emit('update_response', str(self.total_tasks), namespace='/counter')

        if task:
            return {'task': True}
        else:
            return 'Task not found'
```

- add this method to edit a specific task

```py
def edit_task_by_id(self):
        data = request.data
        new_task = self._task.FromString(data) 
        id = int(new_task.id)
        text = new_task.task
        database = Database(DATABASE_PATH)
        
        query = f''' 
            UPDATE {TASK_TABLE_NAME} 
            SET {TASK}='{text}'
            WHERE id={id}
        '''
        
        task_to_edit = database.fetch_all(query)
        
        if task_to_edit:
            return {'task': True}
        else:
            return 'Unable to edit' 
```
## To run this project

1. ``flutter packages pub run build_runner build`` or ``dart run build_runner watch `` to generate mobx content.

2. ``protoc --dart_out=. <path/to/messages.proto>`` to generate protobuf content e.g. ``./lib/src/.../user.proto``. You can read the [protobuf documentation](https://protobuf.dev/getting-started/darttutorial/) and [pub.dev](https://pub.dev/packages/protobuf). Remember to install the compiler. 


3. check your sdk version in ``pubspec.yaml`` 

4. ``flutter run``