import 'package:flutter/material.dart';

class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar(상단바)"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Body"),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("현재 위치 Scaffold에서 보여줄 메신저입니다.")),
                  );
                },
                child: const Text("버튼 클릭하기"),
            ),
          ],
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Column(
                  children: [
                    Icon(Icons.door_front_door),
                    SizedBox(height: 10),
                    Text("홍길동님"),
                    Text("로그아웃"),
                  ],
                ),
            ),
            ListTile(
              leading: const Icon(Icons.bedroom_parent),
              title: const Text("목록1번"),
              // ListTile은 원래 버튼이 아닌데 버튼처럼 사용
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.bedroom_parent),
              title: const Text("목록2번"),
              // ListTile은 원래 버튼이 아닌데 버튼처럼 사용
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.bedroom_parent),
              title: const Text("목록3번"),
              // ListTile은 원래 버튼이 아닌데 버튼처럼 사용
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("제가 보이십니까?"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Icon(Icons.remove_red_eye),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: '창고',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build),
          label: '설정',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wine_bar),
          label: '구독',
        )
      ]),
    );
  }
}