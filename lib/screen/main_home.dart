import 'package:daily_step/screen/main_screen.dart';
import 'package:daily_step/screen/myinfo_screen.dart';
import 'package:daily_step/screen/routine-insert.dart';
import 'package:daily_step/screen/routine_screen.dart';
import 'package:daily_step/shared/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  double progress = 0.3;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _selectedIndex == 0 ? _buildCalendarSection() : _buildScreens(),
      ),
      bottomNavigationBar: MenuBottom(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DateTime dateToSend = _selectedDay ?? DateTime.now();
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoutineInsert()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Column(
      children: [
        _buildHeader(),
        _buildCalendar(),
        _buildProgressIndicator(),
        _buildListView(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20), // 패딩 추가
      alignment: Alignment.centerLeft, // 좌측 정렬
      child: const Text(
        '나의 일상', // 헤더 제목
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Expanded(
      child: TableCalendar(
        // 이미 구현된 캘린더 설정 유지
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }

  Widget _buildProgressIndicator() {
    // 화면의 너비를 기준으로 달성률에 따라 위치를 계산합니다.
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPosition = screenWidth * progress - 15; // 이미지의 중앙이 달성률 위치에 오도록 조정합니다.

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('오늘의 달성률'),
        Stack(
          children: [
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: progress,
              lineHeight: 30,
              backgroundColor: Colors.black38,
              progressColor: Colors.indigo.shade900,
              width: screenWidth,
            ),
            Positioned(
              left: leftPosition < 0 ? 0 : leftPosition, // 화면 왼쪽을 넘지 않도록 조정
              top: -10,
              child: Image.asset('assets/images/kakao.png', width: 30, height: 30, fit: BoxFit.cover),
            ),
          ],
        ),
      ],
    );
  }



  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('목록 아이템 $index'),
          );
        },
      ),
    );
  }

  Widget _buildScreens() {
    switch (_selectedIndex) {
      case 1:
        return const RoutineScreen();
      case 2:
        return const MainScreen();
      default:
        return const MyInfoScreen();
    }
  }
}

