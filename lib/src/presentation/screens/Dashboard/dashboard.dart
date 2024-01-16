import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/presentation/screens/Dashboard/bloc/dashboard_bloc.dart';
import 'package:aureus_group/src/presentation/screens/applied_job/applied_job_screen.dart';
import 'package:aureus_group/src/presentation/screens/home/home_screen.dart';
import 'package:aureus_group/src/presentation/screens/profile/profile_screen.dart';
import 'package:aureus_group/src/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: const _DashboardScreen(),
    );
  }
}

class _DashboardScreen extends StatefulWidget {
  const _DashboardScreen();

  @override
  State<_DashboardScreen> createState() => __DashboardScreenState();
}

class __DashboardScreenState extends State<_DashboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this)
      ..addListener(() {
        if (_tabController.index != _tabController.previousIndex) {}
      });
    _widgetOptions = <Widget>[
      HomeScreen(tabController: _tabController),
      const AppliedJobScreen(),
      const ProfileScreen()
    ];
  }

  _fetchData() {
    context.read<DashboardBloc>().add(GetJobList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      return Scaffold(
        appBar: appBar(state),
        body: _widgetOptions.elementAt(state.tabIndex),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              context.read<DashboardBloc>().add(
                    DashboardSetTabIndex(
                      tabIndex: value,
                    ),
                  );
            },
            items: [
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.list_alt,
                        color: state.tabIndex == 0
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      ),
                      SeparatorWidget.height4(),
                      BodyText.size13Regular(
                        'Jobs Listing',
                        color: state.tabIndex == 0
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      )
                    ],
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.edit,
                        color: state.tabIndex == 1
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      ),
                      SeparatorWidget.height4(),
                      BodyText.size13Regular(
                        'Applied Job',
                        color: state.tabIndex == 1
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      )
                    ],
                  ),
                  label: 'Applied Job'),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: state.tabIndex == 2
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      ),
                      SeparatorWidget.height4(),
                      BodyText.size13Regular(
                        'Profile',
                        color: state.tabIndex == 2
                            ? ConstColors.orange
                            : ConstColors.gray30,
                      )
                    ],
                  ),
                  label: 'Profile'),
            ]),
      );
    });
  }

  AppBar appBar(DashboardState state) {
    return state.tabIndex == 0
        ? AppBarWidgets.homeAppBar(
            context,
            ConstColors.orange,
            personName: 'Mark',
          )
        : AppBarWidgets.customColorAppBarWithIcon(
            context, state.tabIndex == 1 ? 'Your Applied Jobs' : 'Your Profile',
            backgroundColor: ConstColors.basicBackground,
            titleAndIconColor: ConstColors.dark80,
            icon: state.tabIndex == 1 ? Icons.edit : Icons.person);
  }
}
