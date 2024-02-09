import 'package:flutter/material.dart';
import 'package:todo_app/view_model/cubits/cubit_tasks/cubit_task.dart';

import '../../../view_model/uitils/colors.dart';
import 'components/task_widget.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: " Tasks",
                ),
                Tab(
                  text: "Done",
                ),
                Tab(
                  text: "Archive",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(itemBuilder: (context, index) =>  TaskWidget(),
                itemCount:TaskCubit.get(context).tasks.length ,
              ),
              ListView.builder(itemBuilder: (context, index) =>  TaskWidget(),
                itemCount:TaskCubit.get(context).tasks.length ,
              ),
              ListView.builder(itemBuilder: (context, index) =>  TaskWidget(),
                itemCount:TaskCubit.get(context).tasks.length ,
              ),

            ],
          ),
        ));
  }
}
