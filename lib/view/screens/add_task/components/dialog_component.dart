import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../view_model/cubits/cubit_tasks/cubit_task.dart';
import '../../../../view_model/uitils/colors.dart';
import '../../../components/elvetaed_bottun_custom.dart';
import '../../../components/text_custom.dart';
import '../../../components/text_form_field_custom.dart';

class DialogCustom extends StatelessWidget {
  const DialogCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsetsDirectional.all(30),
      contentPadding: EdgeInsetsDirectional.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.green,
          width: 2,
        ),
      ),
      title: TextCustom(
        text: "Add Task",
        fontWeight: FontWeight.w800,
      ),
      content:
      Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormFieldCustom(
              controller: TaskCubit.get(context).titleController,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.green
                  )
              ),
              labelStyleColor: Colors.black!,
              hintText: "Title",
              label: "Title",
              borderColor: AppColors.green!,
              textColor: Colors.black,
            ),
            TextFormFieldCustom(
              textInputAction: TextInputAction.done,
              controller: TaskCubit.get(context).decriptioncontroller,
              focusedBorder: UnderlineInputBorder(

                  borderSide: BorderSide(
                      color: AppColors.green
                  )
              ),
              hintText: "Description",
              labelStyleColor: Colors.black!,
              label: "Description",
              borderColor: AppColors.green,
              textColor: Colors.black,
            ),
            TextFormFieldCustom(
              keyboardType: TextInputType.none,
              controller: TaskCubit.get(context).startDateController,
              onTap: () {
                 showDatePicker(
                   context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year+5),

                 ).then((value){
                   if(value!=null){
                     TaskCubit.get(context).startDateController.text=DateFormat('yyyy-MM-dd').format(value);
                   }
                 } );
              },
              focusedBorder: UnderlineInputBorder(

                  borderSide: BorderSide(
                      color: AppColors.green
                  )
              ),
              labelStyleColor: Colors.black!,
              hintText: "Start Date",
              label: "Start Date",
              borderColor: AppColors.green!,
              textColor: Colors.black,
            ),
            TextFormFieldCustom(
              keyboardType: TextInputType.none,
              controller: TaskCubit.get(context).endDateController,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime
                      .now()
                      .year + 5),

                ).then((value){
                  if(value!=null){
                    TaskCubit.get(context).endDateController.text=DateFormat('yyyy-MM-dd').format(value);
                  }
                } );
              },
              focusedBorder: UnderlineInputBorder(

                  borderSide: BorderSide(
                      color: AppColors.green
                  )
              ),
              labelStyleColor: Colors.black!,
              hintText: "End Date",
              label: "End Date",
              borderColor: AppColors.green!,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: ElevatedButtonCustom(
            width: 80,
            height: 40,
            text: "Add",
            onPressed: () {
              TaskCubit.get(context).addTask();
            },
          ),
        ),
      ],
    );
  }
}
