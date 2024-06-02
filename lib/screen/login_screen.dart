import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 더미 로그인 함수
  void _onKakaoLogin() {
    // 여기에 로그인 로직 구현
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('로그인 페이지'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 로고 이미지
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            // 기본 Material 버튼으로 카카오 로그인 버튼 구현
            ElevatedButton(
              onPressed: _onKakaoLogin, // 버튼 클릭 이벤트 처리
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.yellow, // 텍스트 컬러
              ),
              child: Text('카카오로 로그인하기'),
            ),
          ],
        ),
      ),
    );
  }
}
