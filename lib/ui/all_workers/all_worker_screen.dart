import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';

class AllWorkerScreen extends StatelessWidget {
  const AllWorkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WorkersSearchBloc, WorkersSearchState>(
          builder: (context, state) {
        if (state.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == Status.SUCCESS) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(state.workers[index].name);
            },
          );
        } else if (state.status == Status.ERROR) {
          return Center(
            child: Text(
              state.error.toString(),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
