import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/categories/categories_bloc.dart';
import 'package:open_work/bloc/comments/comments_bloc.dart';
import 'package:open_work/ui/comments/widgets/comment_item.dart';
import 'package:open_work/ui/widgets/single_icon_appbar.dart';
import 'package:open_work/utils/constants.dart';
import 'package:open_work/utils/icons/app_icons.dart';

import '../../data/models/worker_info/worker_info_model.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key, required this.workerInfoModel}) : super(key: key);
  final WorkerInfoModel workerInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleIconAppBar(
        onTap: () {
          Navigator.pushNamed(context, addCommentScreen,arguments: workerInfoModel);
        },
        title: 'Reviews',
        svgIcon: AppIcons.addCommentIcon,
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
        if (state.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == Status.SUCCESS) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 24).w,
            child: ListView.builder(
              itemCount: state.comments.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CommentItem(
                  commentModel: state.comments[index],
                );
              },
            ),
          );
        } else if (state.status == Status.ERROR) {
          return Center(
            child: Text(state.error),
          );
        }
        else {
          return const SizedBox();
        }
      }),
    );
  }
}
