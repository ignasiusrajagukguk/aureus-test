import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/presentation/screens/apply_screen/bloc/apply_screen_bloc.dart';
import 'package:aureus_group/src/presentation/screens/apply_screen/widgets/tab_view_widget.dart';
import 'package:aureus_group/src/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:aureus_group/src/presentation/widgets/buttons/button_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyScreenBloc(),
      child: const _ApplyScreen(),
    );
  }
}

class _ApplyScreen extends StatefulWidget {
  const _ApplyScreen();

  @override
  State<_ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<_ApplyScreen> {
  TextEditingController schoolNameC = TextEditingController();
  TextEditingController courseC = TextEditingController();
  TextEditingController yearC = TextEditingController();

  late PageController pageCtl;
  List<Widget>? items;
  @override
  void initState() {
    super.initState();

    pageCtl = PageController(initialPage: 0, keepPage: true);
    items = [
      TabViewWidgets.documents(context),
      TabViewWidgets.education(context,
          schoolNameC: schoolNameC, courseC: courseC, yearC: yearC),
      TabViewWidgets.profilePreview(context)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyScreenBloc, ApplyScreenState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBarWidgets.customColorAppBarWithBackButton(
            context, '', ConstColors.basicBackground, ConstColors.black),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading.h3Large('Apply To Slack'),
              SeparatorWidget.height15(),
              const BodyText.size13Bold(
                'Uploading of Documents',
                color: ConstColors.orange,
              ),
              SeparatorWidget.height6(),
              LinearProgressIndicator(
                value: state.tabIndex == 0
                    ? 1 / 3
                    : state.tabIndex == 1
                        ? 2 / 3
                        : 1,
                color: ConstColors.orange,
                backgroundColor: ConstColors.orange.withOpacity(0.3),
              ),
              SeparatorWidget.height20(),
              Expanded(child: _onchangeWidget(context)),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget.basicText(
                    'Cancel',
                    action: () {
                      if (state.tabIndex > 0) {
                        pageCtl.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                        context.read<ApplyScreenBloc>().add(
                              ApplyScreenSetTabIndex(
                                tabIndex: state.tabIndex - 1,
                              ),
                            );
                      }
                    },
                    textColor: ConstColors.basicBackground,
                    backgroundColor: ConstColors.gray30,
                  )),
                  SeparatorWidget.width10(),
                  Expanded(
                      child: ButtonWidget.basicText(
                    state.tabIndex == 2 ? 'Send' : 'Next',
                    action: () {
                      if (state.tabIndex < 2) {
                        pageCtl.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);

                        context.read<ApplyScreenBloc>().add(
                              ApplyScreenSetTabIndex(
                                tabIndex: state.tabIndex + 1,
                              ),
                            );
                      }
                      if (state.tabIndex == 2) {
                        successDialog();
                        Future.delayed(const Duration(seconds: 2))
                            .then((value) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
                    },
                    textColor: ConstColors.basicBackground,
                    backgroundColor: ConstColors.orange,
                  )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _onchangeWidget(BuildContext context) {
    return PageView(
      controller: pageCtl,
      physics: const NeverScrollableScrollPhysics(),
      children: items!,
    );
  }

  successDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.hardEdge,
          content: ClipRRect(
            child: Container(
              constraints: const BoxConstraints(minHeight: 60, maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Heading.headingSize20('Success!'),
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Icon(
                    Icons.check,
                    color: ConstColors.orange,
                    size: 150,
                  ),
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Text(
                    'You have Send the application',
                    style: TextStyleConstants.textStyleTextLarge,
                    textAlign: TextAlign.center,
                  ),
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20()
                ],
              ),
            ),
          ),
          titlePadding: const EdgeInsets.only(
            top: 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          insetPadding: const EdgeInsets.all(10),
          backgroundColor: ConstColors.white,
          contentPadding: const EdgeInsets.all(15),
        );
      },
    );
  }
}
