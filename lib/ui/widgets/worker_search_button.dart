import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_work/bloc/workers_search/workers_search_bloc.dart';
import 'package:open_work/data/models/skill/skill_model.dart';
import 'package:open_work/ui/widgets/global_button.dart';
import 'package:open_work/utils/constants.dart';

class WorkerSearchButton extends StatelessWidget {
  const WorkerSearchButton({Key? key, required this.skills}) : super(key: key);

  final List<SkillModel> skills;

  List<int> selectedSkillsIdsFunction() {
    List<int> selectedSkillsIds = skills
        .where((element) => element.isSelected)
        .toList()
        .map((e) => e.id)
        .toList();
    return selectedSkillsIds;
  }

  checkActive() {
    if (selectedSkillsIdsFunction().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w).w,
      child: GlobalButton(
        isActive: checkActive(),
        buttonText: "Workers Search",
        onTap: () {
          BlocProvider.of<WorkersSearchBloc>(context).add(FetchWorkers(
              allowedSkillsId: selectedSkillsIdsFunction(), sortOptions: 0));
          Navigator.pushNamed(context, allWorkers);
        },
      ),
    );
  }
}
