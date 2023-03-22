import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/busynesses/busynesses_bloc.dart';

import '../../../../data/models/form_status/form_status.dart';

class CreateBusynessPage extends StatelessWidget {
  const CreateBusynessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create busyness"),
      ),
      body: BlocConsumer<BusynessesBloc, BusynessesState>(
          listener: (context, state) {
        if (state.status == FormStatus.gettingInSuccess) {}
      }, builder: (context, state) {
        if (state.status == FormStatus.gettingInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == FormStatus.gettingInSuccess) {
          return Column(
            children: [
              SizedBox(
                width: 300.w,
                child: ElevatedButton(
                  onPressed: () {
                    _openRangeDatePicker(context);
                  },
                  child: const Text('Create busyness'),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text(state.errorMessage.toString()),
          );
        }
      }),
    );
  }

  void _openRangeDatePicker(BuildContext context) {
    BottomPicker.range(
      title: 'Set date range',
      description: 'Please select a first date and an end date',
      dateOrder: DatePickerDateOrder.dmy,
      minFirstDate: DateTime.now(),
      minSecondDate: DateTime.now().add(const Duration(days: 1)),
      pickerTextStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      descriptionStyle: const TextStyle(
        color: Colors.black,
      ),
      onSubmitPressed: (firstDate, secondDate) async {
        context
            .read<BusynessesBloc>()
            .add(CreateBusynessesEvent(starts: firstDate, ends: secondDate));
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}
