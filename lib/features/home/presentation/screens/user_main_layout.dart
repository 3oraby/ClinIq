import 'package:cliniq/core/widgets/app_bottom_navigation_bar.dart';
import 'package:cliniq/features/ai/presentation/widgets/ai_chat_view.dart';
import 'package:cliniq/features/appointments/presentation/widgets/user_appoinments_view.dart';
import 'package:cliniq/features/chat/presentation/widgets/chats_view.dart';
import 'package:cliniq/features/home/presentation/widgets/user_home_view.dart';
import 'package:cliniq/features/user/presentation/widgets/user_profile_view.dart';
import 'package:flutter/material.dart';

class UserMainLayout extends StatefulWidget {
  const UserMainLayout({super.key});

  @override
  State<UserMainLayout> createState() => _UserMainLayoutState();
}

class _UserMainLayoutState extends State<UserMainLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          UserHomeView(),
          UserAppointmentsView(),
          AiChatView(),
          ChatsView(),
          UserProfileView(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
