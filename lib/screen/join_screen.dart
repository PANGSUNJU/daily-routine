import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SVG 이미지를 사용하기 위해 추가

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 사용자 프로필 이미지 미리보기 영역
            CircleAvatar(
              radius: 50, // 원하는 반지름 설정
              // SVG 이미지 사용
              backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
              child: SvgPicture.asset(
                'assets/images/default_profile.svg', // SVG 이미지 경로
                width: 100, // 원하는 너비 설정
                height: 100, // 원하는 높이 설정
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
            ),
            SizedBox(height: 20),
            // 닉네임 입력 필드
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "닉네임",
              ),
            ),
            SizedBox(height: 20),
            // 시작하기 버튼 생성
            ElevatedButton(
              onPressed: () {
                // 닉네임 입력 후 홈 화면으로 이동
                Navigator.pushReplacementNamed(context, "/");
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.yellow, backgroundColor: Colors.blue, // 버튼 글자 및 아이콘 색상
              ),
              child: Text("시작하기", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
