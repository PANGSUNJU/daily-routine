import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTapped; // 선택적으로 만듦

  const MenuBottom({
    Key? key,
    required this.selectedIndex,
    this.onItemTapped, // 필수가 아닌 선택적 매개변수로 변경
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.loop),
          label: '루틴관리',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: '소셜',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '내정보',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped, // null일 경우 아무 동작도 하지 않음
    );
  }
}
