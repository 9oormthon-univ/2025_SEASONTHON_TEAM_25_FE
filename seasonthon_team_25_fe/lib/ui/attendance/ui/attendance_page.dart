import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/presentation/provider/attendance_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  int _currentYear = DateTime.now().year;
  int _currentMonth = DateTime.now().month;

  @override
  void initState() {
    super.initState();
    // 위젯이 빌드된 후 캘린더 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCalendar();
    });
  }

  void _loadCalendar() {
    ref.read(attendanceControllerProvider.notifier).loadCalendar(
      year: _currentYear,
      month: _currentMonth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '출석 체크',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () => context.go("/home"),
      ),
      body: Column(
        children: [
          // 상단 정보 섹션
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // 날짜 선택 (독립적으로 위쪽에 위치)
                GestureDetector(
                  onTap: _showMonthYearPicker,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.wt,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${_currentYear}년 ${_currentMonth}월',
                          style: AppTypography.h3.copyWith(color: AppColors.primarySky),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primarySky,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // 누적 출석 일수 카드
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.wt,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                    border: Border.all(
                      color: AppColors.primarySky,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '누적 출석 일수',
                        style: AppTypography.m500.copyWith(color: AppColors.primarySky),
                      ),
                      Text(
                        '${attendanceState.calendarData?.attendanceCount ?? 0}일',
                        style: AppTypography.h2.copyWith(color: AppColors.primarySky),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 캘린더 섹션
          Expanded(
            child: attendanceState.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.primarySky,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '캘린더를 불러오는 중...',
                          style: AppTypography.m500.copyWith(color: AppColors.gr600),
                        ),
                      ],
                    ),
                  )
                : attendanceState.calendarData != null
                    ? _buildCalendar(attendanceState.calendarData!)
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: AppColors.secondaryRd,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '캘린더를 불러올 수 없습니다.',
                              style: AppTypography.m500.copyWith(color: AppColors.gr600),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _loadCalendar,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primarySky,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppRadius.button),
                                ),
                              ),
                              child: Text(
                                '다시 시도',
                                style: AppTypography.m500.copyWith(color: AppColors.wt),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(calendarData) {
    final daysInMonth = calendarData.totalDays;
    final startDayOfWeek = calendarData.startDayOfWeek;
    final attendanceMap = calendarData.attendanceMap;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // 요일 헤더
          Row(
            children: [
              _buildDayHeader('Sun', isSunday: true),
              _buildDayHeader('Mon'),
              _buildDayHeader('Tue'),
              _buildDayHeader('Wed'),
              _buildDayHeader('Thu'),
              _buildDayHeader('Fri'),
              _buildDayHeader('Sat'),
            ],
          ),
          const SizedBox(height: 16),
          
          // 캘린더 그리드
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 35, // 5주 * 7일
              itemBuilder: (context, index) {
                final dayNumber = index - startDayOfWeek + 1;
                
                if (dayNumber < 1 || dayNumber > daysInMonth) {
                  return const SizedBox(); // 빈 셀
                }
                
                final isAttended = dayNumber <= attendanceMap.length 
                    ? attendanceMap[dayNumber - 1] 
                    : false;
                
                return _buildDayCell(dayNumber.toInt(), isAttended);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayHeader(String day, {bool isSunday = false}) {
    return Expanded(
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: AppTypography.s500.copyWith(
          color: isSunday ? AppColors.secondaryRd : AppColors.secondaryBl,
        ),
      ),
    );
  }

  Widget _buildDayCell(int dayNumber, bool isAttended) {
    final isToday = dayNumber == DateTime.now().day && _currentMonth == DateTime.now().month && _currentYear == DateTime.now().year;
    final isFutureDay = (_currentYear > DateTime.now().year) || 
                        (_currentYear == DateTime.now().year && _currentMonth > DateTime.now().month) ||
                        (_currentYear == DateTime.now().year && _currentMonth == DateTime.now().month && dayNumber > DateTime.now().day);

    Color backgroundColor;
    Widget icon;
    Color textColor;

    if (isFutureDay) {
      backgroundColor = AppColors.gr200;
      icon = const SizedBox.shrink();
      textColor = AppColors.gr600;
    } else if (isAttended) {
      backgroundColor = AppColors.primarySky;
      icon = Icon(Icons.check, color: AppColors.wt, size: 16);
      textColor = AppColors.wt;
    } else {
      backgroundColor = AppColors.gr400;
      icon = Icon(Icons.close, color: AppColors.wt, size: 16);
      textColor = AppColors.wt;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: isToday ? Border.all(color: AppColors.secondaryRd, width: 2) : null,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 2),
            Text(
              '$dayNumber',
              style: AppTypography.s400.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  void _showMonthYearPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
        ),
        title: Text(
          '년월 선택',
          style: AppTypography.h3.copyWith(color: AppColors.secondaryBl),
          textAlign: TextAlign.center,
        ),
        content: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 년도 선택
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.gr100,
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  border: Border.all(color: AppColors.gr200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: AppColors.primarySky, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '년도',
                      style: AppTypography.m500.copyWith(color: AppColors.secondaryBl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButton<int>(
                        value: _currentYear,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: AppTypography.m500.copyWith(color: AppColors.secondaryBl),
                        items: List.generate(DateTime.now().year - 2025 + 1, (index) {
                          final year = 2025 + index;
                          return DropdownMenuItem(
                            value: year,
                            child: Text('$year년'),
                          );
                        }),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _currentYear = value;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 월 선택
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.gr100,
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  border: Border.all(color: AppColors.gr200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.date_range, color: AppColors.primarySky, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '월',
                      style: AppTypography.m500.copyWith(color: AppColors.secondaryBl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButton<int>(
                        value: _currentMonth,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: AppTypography.m500.copyWith(color: AppColors.secondaryBl),
                        items: List.generate(DateTime.now().month, (index) {
                          final month = index + 1;
                          return DropdownMenuItem(
                            value: month,
                            child: Text('${month}월'),
                          );
                        }),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _currentMonth = value;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                  ),
                  child: Text(
                    '취소',
                    style: AppTypography.m500.copyWith(color: AppColors.gr600),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _loadCalendar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarySky,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                  ),
                  child: Text(
                    '확인',
                    style: AppTypography.m500.copyWith(color: AppColors.wt),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}