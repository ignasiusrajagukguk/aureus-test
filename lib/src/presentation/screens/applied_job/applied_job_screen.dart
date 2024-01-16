import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/data/models/job_list_model.dart';
import 'package:aureus_group/src/data/models/job_model.dart';
import 'package:aureus_group/src/presentation/screens/Dashboard/bloc/dashboard_bloc.dart';
import 'package:aureus_group/src/presentation/screens/home/widgets.dart/job_card.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppliedJobScreen extends StatelessWidget {
  const AppliedJobScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeparatorWidget.height15(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: BodyText.dflt(
            'You applied for 2 jobs',
            color: ConstColors.gray30,
          ),
        ),
        Expanded(
          child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
            if (state.requestState == RequestState.success) {
              JobListModel jobListModel = state.jobListModel;
              List<JobModel> listJobModel = jobListModel.data ?? [];
              List<JobModel> listAppliedJobModel = listJobModel
                  .where((element) => element.isApplied == true)
                  .toList();
              return ListView.builder(
                itemCount: listAppliedJobModel.length,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                itemBuilder: (context, index) {
                  return JobCard(jobModel: listAppliedJobModel[index]);
                },
              );
            } else {
              return const Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: ConstColors.orange,
                      )));
            }
          }),
        ),
      ],
    );
  }
}
