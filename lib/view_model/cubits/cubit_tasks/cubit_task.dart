import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task_model/task_model.dart';
import 'package:todo_app/view_model/cubits/cubit_tasks/cubit_states.dart';
class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitState());
  static TaskCubit get(context) => BlocProvider.of<TaskCubit>(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController decriptioncontroller = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  List<TaskModel> tasks = [];
  void addTask() {
    TaskModel taskModel=TaskModel(
        title:titleController.text,
        description:decriptioncontroller.text,
        startDate:startDateController.text,
    endDate:endDateController.text,
    );
    tasks.add(taskModel);
    emit(AddTaskState());
  }
  void reset(){
    titleController.clear();
    decriptioncontroller.clear();
    startDateController.clear();
    endDateController.clear();

  }
}

