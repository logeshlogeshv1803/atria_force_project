import 'package:atria_force_ssample/core/constants/asset_images.dart';
import 'package:atria_force_ssample/core/constants/palette.dart';
import 'package:atria_force_ssample/presentation/widgets/dashboard_widget/bottom_nav_item.dart';
import 'package:atria_force_ssample/presentation/widgets/dashboard_widget/calendar_widget.dart';
import 'package:atria_force_ssample/presentation/widgets/dashboard_widget/opportunity_widget.dart';
import 'package:atria_force_ssample/presentation/widgets/dashboard_widget/summary_card.dart';
import 'package:atria_force_ssample/presentation/widgets/dashboard_widget/survey_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;
  int _selectedBottomNavIndex = 0;
  int _selectedSummaryCardIndex = -1;
  int _selectedCalendarIndex = 0;
  int _selectedSurveyCardIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = kIsWeb
        ? screenSize.width < 768
        : (screenSize.width < screenSize.height
                  ? screenSize.width
                  : screenSize.height) <
              768;

    if (isMobile) {
      return _buildMobileDashboard();
    } else {
      return _buildWebDashboard();
    }
  }

  Widget _buildWebDashboard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileView = screenWidth < 768;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Palette.backgroundGrey,
      body: Row(
        children: [
          if (!isMobileView)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSidebar(),
            ),
          Expanded(
            child: Container(
              color: Palette.backgroundGrey,
              child: Column(
                children: [
                  _buildTopHeader(isMobileView),
                  Expanded(child: _buildMainContent(isWeb: true)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDashboard() {
    return Scaffold(
      backgroundColor: Palette.backgroundGrey,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcome back, Abdeali',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textPrimary,
                                    ),
                                  ),
                                  const Text(
                                    'Your assigned tasks and site visits for Fri, Jan 16th',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Palette.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AssetSVGImages.questionIcon),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  AssetSVGImages.notificationIcon,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search across all records',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CalendarWidget(
                                text: 'Today',
                                isSelected: _selectedCalendarIndex == 0,
                                onTap: () {
                                  setState(() {
                                    _selectedCalendarIndex =
                                        _selectedCalendarIndex == 0 ? -1 : 0;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              CalendarWidget(
                                text: 'Tomorrow',
                                isSelected: _selectedCalendarIndex == 1,
                                onTap: () {
                                  setState(() {
                                    _selectedCalendarIndex =
                                        _selectedCalendarIndex == 1 ? -1 : 1;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              CalendarWidget(
                                text: 'This Week',
                                isSelected: _selectedCalendarIndex == 2,
                                onTap: () {
                                  setState(() {
                                    _selectedCalendarIndex =
                                        _selectedCalendarIndex == 2 ? -1 : 2;
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              CalendarWidget(
                                text: 'This Month',
                                isSelected: _selectedCalendarIndex == 3,
                                onTap: () {
                                  setState(() {
                                    _selectedCalendarIndex =
                                        _selectedCalendarIndex == 3 ? -1 : 3;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SummaryCard(
                                icon: AssetSVGImages.calendarTick,
                                number: '12',
                                label: 'SCHEDULED SURVEY',
                                borderColor: Palette.primaryRed,
                                isSelected: _selectedSummaryCardIndex == 0,
                                onTap: () {
                                  setState(() {
                                    _selectedSummaryCardIndex =
                                        _selectedSummaryCardIndex == 0 ? -1 : 0;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SummaryCard(
                                icon: AssetSVGImages.calendarTick,
                                number: '4',
                                numberColor: Palette.green,
                                label: 'COMPLETED SURVEY',
                                isSelected: _selectedSummaryCardIndex == 1,
                                onTap: () {
                                  setState(() {
                                    _selectedSummaryCardIndex =
                                        _selectedSummaryCardIndex == 1 ? -1 : 1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: SummaryCard(
                                icon: AssetSVGImages.writtenReport,
                                number: '26',
                                label: 'PENDING TASKS',
                                badge: '13/39 Done',
                                isSelected: _selectedSummaryCardIndex == 2,
                                onTap: () {
                                  setState(() {
                                    _selectedSummaryCardIndex =
                                        _selectedSummaryCardIndex == 2 ? -1 : 2;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SummaryCard(
                                icon: AssetSVGImages.calendarTick,
                                number: '3',
                                label: 'OVERDUE TASKS',
                                numberColor: Palette.primaryRed,
                                iconColor: Palette.primaryRed,
                                isSelected: _selectedSummaryCardIndex == 3,
                                onTap: () {
                                  setState(() {
                                    _selectedSummaryCardIndex =
                                        _selectedSummaryCardIndex == 3 ? -1 : 3;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Today's Scheduled Site Survey",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.textPrimary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See all',
                                  style: TextStyle(color: Palette.primaryRed),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: SurveyCard(
                                    isSelected:
                                        _selectedSurveyCardIndex == index,
                                    onTap: () {
                                      setState(() {
                                        _selectedSurveyCardIndex =
                                            _selectedSurveyCardIndex == index
                                                ? -1
                                                : index;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.rocket_launch,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Hot Opportunities',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See all',
                                  style: TextStyle(color: Palette.primaryRed),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 400,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return const OpportunityWidget();
                              },
                              separatorBuilder: (context, index) {
                                return LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Transform.translate(
                                      offset: const Offset(-18, 0),
                                      child: Container(
                                        width: constraints.maxWidth + 36,
                                        height: 1,
                                        color: Palette.borderGrey,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: BottomNavigationBar(
          currentIndex: _selectedBottomNavIndex,
          onTap: (index) {
            setState(() {
              _selectedBottomNavIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.primaryRed,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedBottomNavIndex == 0
                        ? Palette.primaryRed
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(AssetSVGImages.dashboardSymbolIcon),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedBottomNavIndex == 1
                      ? Palette.primaryRed
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(AssetSVGImages.dualPeople),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedBottomNavIndex == 2
                      ? Palette.primaryRed
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(AssetSVGImages.tripleCircleIcon),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedBottomNavIndex == 3
                      ? Palette.primaryRed
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(AssetSVGImages.settingIcon),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      width: 250,
      child: _buildSidebarContent(),
    );
  }

  Widget _buildSidebarContent({BuildContext? bottomSheetContext}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              SvgPicture.asset(AssetSVGImages.dashboardIcon),
              const SizedBox(width: 12),
              const Text(
                'ATRIAFORCE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Palette.primaryRed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              BottomNavItem(
                icon: AssetSVGImages.dashboardSymbolIcon,
                title: 'Dashboard',
                isSelected: _selectedNavIndex == 0,
                onTap: () {
                  setState(() => _selectedNavIndex = 0);
                  if (bottomSheetContext != null) {
                    Navigator.pop(bottomSheetContext);
                  }
                },
              ),
              BottomNavItem(
                icon: AssetSVGImages.dualPeople,
                title: 'Leads',
                isSelected: _selectedNavIndex == 1,
                onTap: () {
                  setState(() => _selectedNavIndex = 1);
                  if (bottomSheetContext != null) {
                    Navigator.pop(bottomSheetContext);
                  }
                },
              ),
              BottomNavItem(
                icon: AssetSVGImages.tripleCircleIcon,
                title: 'Opportunity',
                isSelected: _selectedNavIndex == 2,
                onTap: () {
                  setState(() => _selectedNavIndex = 2);
                  if (bottomSheetContext != null) {
                    Navigator.pop(bottomSheetContext);
                  }
                },
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              BottomNavItem(
                icon: AssetSVGImages.settingIcon,
                title: 'Settings',
                isSelected: false,
                onTap: () {
                  if (bottomSheetContext != null) {
                    Navigator.pop(bottomSheetContext);
                  }
                },
              ),
              BottomNavItem(
                icon: AssetSVGImages.logoutIcon,
                title: 'Log Out',
                isSelected: false,
                onTap: () {
                  if (bottomSheetContext != null) {
                    Navigator.pop(bottomSheetContext);
                  }
                },
                iconColor: Palette.primaryRed,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTopHeader(bool isMobileView) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(color: Palette.backgroundGrey),
      child: Row(
        children: [
          if (isMobileView)
            SvgPicture.asset(AssetSVGImages.dashboardSymbolIcon),
          if (isMobileView) const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search across all records',
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          SvgPicture.asset(AssetSVGImages.questionIcon),
          const SizedBox(width: 8),
          SvgPicture.asset(AssetSVGImages.notificationIcon),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Palette.primaryRed,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: const Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Abdeali Ravat',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Palette.textPrimary,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down,
                  color: Palette.textPrimary,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent({bool isWeb = false}) {
    return Container(
      color: Palette.backgroundGrey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, Abdeali',
              style: TextStyle(
                fontSize: isWeb ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: Palette.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your assigned tasks and site visits for Fri, Jan 16th',
              style: TextStyle(fontSize: 14, color: Palette.textSecondary),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (isWeb)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.refresh,
                      color: Palette.textSecondary,
                      size: 20,
                    ),
                  ),
                if (isWeb) const SizedBox(width: 8),
                CalendarWidget(
                  text: 'Today',
                  isSelected: _selectedCalendarIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedCalendarIndex = _selectedCalendarIndex == 0
                          ? -1
                          : 0;
                    });
                  },
                ),
                const SizedBox(width: 8),
                CalendarWidget(
                  text: 'Tomorrow',
                  isSelected: _selectedCalendarIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedCalendarIndex = _selectedCalendarIndex == 1
                          ? -1
                          : 1;
                    });
                  },
                ),
                const SizedBox(width: 8),
                CalendarWidget(
                  text: 'This Week',
                  isSelected: _selectedCalendarIndex == 2,
                  onTap: () {
                    setState(() {
                      _selectedCalendarIndex = _selectedCalendarIndex == 2
                          ? -1
                          : 2;
                    });
                  },
                ),
                const SizedBox(width: 8),
                CalendarWidget(
                  text: 'This Month',
                  isSelected: _selectedCalendarIndex == 3,
                  onTap: () {
                    setState(() {
                      _selectedCalendarIndex = _selectedCalendarIndex == 3
                          ? -1
                          : 3;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (isWeb)
              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      icon: AssetSVGImages.calendarTick,
                      number: '12',
                      label: 'SCHEDULED SURVEY',
                      isSelected: _selectedSummaryCardIndex == 0,
                      onTap: () {
                        setState(() {
                          _selectedSummaryCardIndex =
                              _selectedSummaryCardIndex == 0 ? -1 : 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SummaryCard(
                      icon: AssetSVGImages.calendarTick,
                      number: '4',
                      numberColor: Palette.green,
                      label: 'COMPLETED SURVEY',
                      isSelected: _selectedSummaryCardIndex == 1,
                      onTap: () {
                        setState(() {
                          _selectedSummaryCardIndex =
                              _selectedSummaryCardIndex == 1 ? -1 : 1;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SummaryCard(
                      icon: AssetSVGImages.writtenReport,
                      number: '26',
                      label: 'PENDING TASKS',
                      badge: '13/39 Done',
                      isSelected: _selectedSummaryCardIndex == 2,
                      onTap: () {
                        setState(() {
                          _selectedSummaryCardIndex =
                              _selectedSummaryCardIndex == 2 ? -1 : 2;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SummaryCard(
                      icon: AssetSVGImages.reportFailed,
                      number: '3',
                      label: 'OVERDUE TASKS',
                      numberColor: Palette.primaryRed,
                      iconColor: Palette.primaryRed,
                      isSelected: _selectedSummaryCardIndex == 3,
                      onTap: () {
                        setState(() {
                          _selectedSummaryCardIndex =
                              _selectedSummaryCardIndex == 3 ? -1 : 3;
                        });
                      },
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SummaryCard(
                          icon: AssetSVGImages.calendarTick,
                          number: '12',
                          label: 'SCHEDULED SURVEY',
                          isSelected: _selectedSummaryCardIndex == 0,
                          onTap: () {
                            setState(() {
                              _selectedSummaryCardIndex =
                                  _selectedSummaryCardIndex == 0 ? -1 : 0;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SummaryCard(
                          icon: AssetSVGImages.calendarTick,
                          number: '4',
                          label: 'COMPLETED SURVEY',
                          isSelected: _selectedSummaryCardIndex == 1,
                          onTap: () {
                            setState(() {
                              _selectedSummaryCardIndex =
                                  _selectedSummaryCardIndex == 1 ? -1 : 1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SummaryCard(
                          icon: AssetSVGImages.calendarTick,
                          number: '26',
                          label: 'PENDING TASKS',
                          badge: '13/39 Done',
                          isSelected: _selectedSummaryCardIndex == 2,
                          onTap: () {
                            setState(() {
                              _selectedSummaryCardIndex =
                                  _selectedSummaryCardIndex == 2 ? -1 : 2;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SummaryCard(
                          icon: AssetSVGImages.calendarTick,
                          number: '3',
                          label: 'OVERDUE TASKS',
                          numberColor: Palette.primaryRed,
                          iconColor: Palette.primaryRed,
                          isSelected: _selectedSummaryCardIndex == 3,
                          onTap: () {
                            setState(() {
                              _selectedSummaryCardIndex =
                                  _selectedSummaryCardIndex == 3 ? -1 : 3;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 32),
            if (isWeb)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today's Scheduled Site Survey",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Palette.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 500,
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: SurveyCard(
                                    isSelected:
                                        _selectedSurveyCardIndex == index,
                                    onTap: () {
                                      setState(() {
                                        _selectedSurveyCardIndex =
                                            _selectedSurveyCardIndex == index
                                            ? -1
                                            : index;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AssetSVGImages.rocketIcon),
                              const SizedBox(width: 14),
                              const Text(
                                'Hot Opportunities',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 500,
                            child: ListView.separated(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return const OpportunityWidget();
                              },
                              separatorBuilder: (context, index) {
                                return LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Transform.translate(
                                      offset: const Offset(-18, 0),
                                      child: Container(
                                        width: constraints.maxWidth + 36,
                                        height: 1,
                                        color: Palette.borderGrey,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Today's Scheduled Site Survey",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: SurveyCard(
                                    isSelected:
                                        _selectedSurveyCardIndex == index,
                                    onTap: () {
                                      setState(() {
                                        _selectedSurveyCardIndex =
                                            _selectedSurveyCardIndex == index
                                            ? -1
                                            : index;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.rocket_launch,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Hot Opportunities',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See all',
                                  style: TextStyle(color: Palette.primaryRed),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 400,
                            child: ListView.separated(
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return const OpportunityWidget();
                              },
                              separatorBuilder: (context, index) {
                                return LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Container(
                                        height: 1,
                                        color: Palette.borderGrey,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
