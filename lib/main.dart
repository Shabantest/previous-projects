
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/screens/add_task/add_task_screen.dart';
import 'package:todo_app/view_model/cubits/cubit_tasks/cubit_task.dart';
void main(){
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>TaskCubit() ,),
      ],
      child: const MaterialApp(
        home:AddTskScreen(),
      ),
    ),
  );
}