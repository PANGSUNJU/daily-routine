import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class RoutineInsert extends StatefulWidget {
  const RoutineInsert({super.key});

  @override
  State<RoutineInsert> createState() => _RoutineInsertState();
}

class _RoutineInsertState extends State<RoutineInsert> {
  late TextEditingController _nameController;
  late TextEditingController _memoController;
  List<bool> _daysSelected = List.generate(7, (_) => false);
  DateTime _notificationTime = DateTime.now();
  int _selectedColorIndex = 0;
  final List<Color> _colors = List.generate(10, (index) => Colors.primaries[index % Colors.primaries.length]);

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _memoController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Widget _buildColorPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('색상 선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _colors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 50,
                  decoration: BoxDecoration(
                    color: _colors[index],
                    border: _selectedColorIndex == index ? Border.all(color: Colors.black, width: 2) : null,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDaySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('요일 선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ToggleButtons(
          isSelected: _daysSelected,
          onPressed: (int index) async {
            setState(() {
              _daysSelected[index] = !_daysSelected[index];
            });
            if (_daysSelected[index]) {
              DateTime? selectedTime = (await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(_notificationTime),
              )) as DateTime?;
              if (selectedTime != null) {
                setState(() {
                  _notificationTime = DateTime(_notificationTime.year, _notificationTime.month, _notificationTime.day, selectedTime.hour, selectedTime.minute);
                });
              }
            }
          },
          children: const <Widget>[
            Text('월'), Text('화'), Text('수'), Text('목'), Text('금'), Text('토'), Text('일'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('루틴 추가'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('루틴 명', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '루틴 명을 입력해 주세요',
                ),
              ),
              SizedBox(height: 20),
              _buildDaySelection(),
              SizedBox(height: 20),
              Text('시간 선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 24, color: Colors.grey),
                highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.black),
                spacing: 50,
                itemHeight: 80,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    _notificationTime = time;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildColorPicker(),
              SizedBox(height: 20),
              Text('메모', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: _memoController,
                decoration: InputDecoration(
                  labelText: '메모',
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: RoutineInsert()));
