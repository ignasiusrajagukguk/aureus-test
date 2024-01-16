import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/icon_path.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/data/models/job_model.dart';
import 'package:aureus_group/src/presentation/widgets/buttons/button_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final JobModel jobModel;
  const JobCard({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearchModal(context);
      },
      child: Container(
        color: ConstColors.white,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: BodyText.size13Bold(
                  jobModel.name ?? '',
                  color: ConstColors.orange,
                )),
                BodyText.size13Regular(
                  jobModel.dueDate ?? '',
                  color: ConstColors.gray30,
                )
              ],
            ),
            SeparatorWidget.height12(),
            BodyText.largeBold(
              jobModel.jobTitle ?? '',
              color: ConstColors.dark80,
            ),
            SeparatorWidget.height12(),
            Row(
              children: [
                Image.asset(
                  IconPaths.moneyIcon,
                  color: ConstColors.gray30,
                  height: 20,
                ),
                SeparatorWidget.width8(),
                BodyText.size13Regular(
                    '\$${(jobModel.minSalary ?? 0) / 1000}-\$${(jobModel.maxSalary ?? 0) / 1000}/month',
                    color: ConstColors.gray30),
                SeparatorWidget.width15(),
                BodyText.size13Regular(
                  jobModel.address ?? '',
                  color: ConstColors.gray30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  showSearchModal(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: Column(
              children: [
                SeparatorWidget.height15(),
                Container(
                  height: 5,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ConstColors.gray30.withOpacity(0.2)),
                ),
                SeparatorWidget.height20(),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SeparatorWidget.height15(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 150,
                                      child: Image.network(
                                        jobModel.image ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                SeparatorWidget.height10(),
                                BodyText.dfltBold(
                                  jobModel.name ?? '',
                                  color: ConstColors.orange,
                                ),
                                SeparatorWidget.height10(),
                                Heading.h4Bold(
                                  jobModel.jobTitle ?? '',
                                  color: ConstColors.dark80,
                                ),
                                SeparatorWidget.height10(),
                                BodyText.dflt(
                                  jobModel.address ?? '',
                                  color: ConstColors.gray30,
                                ),
                              ],
                            ),
                            SeparatorWidget.height20(),
                          ],
                        ),
                      ),
                      const BodyText.dfltBold('Job Description'),
                      SeparatorWidget.height10(),
                      BodyText.dflt(jobModel.jobDesc ?? ''),
                      SeparatorWidget.height12(),
                      const BodyText.dfltBold('Job Description'),
                      SeparatorWidget.height10(),
                      BodyText.dflt(requirements())
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ButtonWidget.basicText('Apply This Job', action: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.applyScreen);
                  },
                      backgroundColor: ConstColors.orange,
                      textColor: ConstColors.white),
                )
              ],
            ),
          );
        });
  }

  String requirements() {
    var requirements = (jobModel.requirements ?? '').split('\n').join('\n- ');
    return requirements;
  }
}
