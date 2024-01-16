import 'package:aureus_group/src/common/constants/animations_path.dart';
import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/data/models/job_list_model.dart';
import 'package:aureus_group/src/data/models/job_model.dart';
import 'package:aureus_group/src/presentation/screens/Dashboard/bloc/dashboard_bloc.dart';
import 'package:aureus_group/src/presentation/screens/home/widgets.dart/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  final TabController tabController;
  const HomeScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TabBar(
            controller: tabController,
            labelColor: ConstColors.gray30,
            indicatorColor: ConstColors.orange,
            tabs: const [
              Tab(
                text: 'Recent Jobs',
              ),
              Tab(text: 'Near You'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                if (state.requestState == RequestState.success) {
                  JobListModel jobListModel = state.jobListModel;
                  List<JobModel> listJobModel = jobListModel.data ?? [];
                  return ListView.builder(
                    itemCount: listJobModel.length,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    itemBuilder: (context, index) {
                      return JobCard(jobModel: listJobModel[index]);
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
              Center(
                child: Lottie.asset(AnimationsPath.public.emptyAnimation,
                    width: 200),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
