import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  bool _isPushNotificationsEnabled = false;
  bool _isProfilePublic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0), // 주석과 일치하도록 수정했습니다.
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('내 정보', style: TextStyle(fontSize: 30)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                              'assets/images/default_profile.svg',
                              width: 100,
                              height: 100,
                              placeholderBuilder: (BuildContext context) => Container(
                                padding: const EdgeInsets.all(30.0),
                                child: CircularProgressIndicator(), // 여기서 const 제거
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(children: [
                            Text('닉네임', style: TextStyle(fontSize: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text('팔로워'),
                                    Text('0'),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text('팔로잉'),
                                    Text('0'),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text('루틴'),
                                    Text('0'),
                                  ],
                                ),
                              ],
                            ),

                          ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/profileUpdate");
                            },
                            child: const Text('>'),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SwitchListTile(
                        title: Text('푸시 알람'),
                        value: _isPushNotificationsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isPushNotificationsEnabled = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text('프로필 공개'),
                        value: _isProfilePublic,
                        onChanged: (bool value) {
                          setState(() {
                            _isProfilePublic = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
