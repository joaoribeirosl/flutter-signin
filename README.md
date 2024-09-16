# flutter-signin

This Flutter project was developed as a technical assessment for residents selected to work on the front-end of projects within the UFPE's CIn/Softex postgraduate program. The goal is to evaluate the skills of the team members in Flutter development.

## Architecture and Libraries

This project follows the Clean Architecture principles, ensuring a clear separation of concerns and maintainability. The structure of the project is modular, allowing for scalable and easily testable code. 

### Key Technologies Used:
- **Clean Dart**
- **Flutter Modular**
- **MobX**

## Backend Repository
https://github.com/jefferson-norberto2/api_tasks

## updates in API

- in register_routes(self) method add this line: 
```py
self._app.add_url_rule('/remove_task_by_id', 'remove_task_by_id', self.remove_task_by_id, methods=['DELETE'])
```

- in get_tasks(self) method change the query to:
```py
query = f'''
            SELECT * FROM {TASK_TABLE_NAME}
            WHERE {USER}={id}
            ORDER BY id DESC
        '''
```
- add this method to remove_task_by_id:

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



## To run this project

1. ``flutter packages pub run build_runner build`` to generate mobx content.
2. check your sdk version in ``pubspec.yaml`` 
3. ``flutter run``