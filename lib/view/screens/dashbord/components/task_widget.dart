import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/components/text_custom.dart';
import 'package:todo_app/view_model/cubits/cubit_tasks/cubit_states.dart';
import 'package:todo_app/view_model/cubits/cubit_tasks/cubit_task.dart';
import 'package:todo_app/view_model/uitils/colors.dart';
class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit,TaskStates>(
      buildWhen: (previous, current) => current is AddTaskState,
      builder: (context, state) {
        var cubit= TaskCubit.get(context);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(12),
            width: 400,
            height: 150,
            margin: EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
              border: Border.all(color: AppColors.green,width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: cubit.titleController.text,

                    ),
                    TextCustom(
                      text:cubit.decriptioncontroller.text,
                    ),
                    TextCustom(
                      text: cubit.startDateController.text,
                    ),
                    TextCustom(
                      text:  cubit.endDateController.text,
                    ),
                  ],
                ),
                Icon(Icons.event_available,color: AppColors.green),
              ],
            ),
          ),
        ],
      );
    },);
  }
}
