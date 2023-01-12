import 'package:flutter/material.dart';
import 'package:student_management_system_app/constants/static_user.dart';
import 'package:student_management_system_app/ui/add_lesson/add_lesson_page.dart';
import 'package:student_management_system_app/ui/calendar/calendar_page.dart';
import 'package:student_management_system_app/ui/grade/grade_page.dart';
import 'package:student_management_system_app/ui/lecture/lecturer_page.dart';

import '../../data/remote/model/auth_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User user = User();
  List<Widget> screens = [];

  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen =
        StaticUser.userType == "student" ? GradePage() : AddLessonPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileHeader(context),
                SideBarScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfileHeader(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${StaticUser.firstName} ${StaticUser.lastName}",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Mail: ${StaticUser.email} /Type: ${StaticUser.userType}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                  ),
                ),
              ],
            ),
            Container(
              child: Image.network(StaticUser.photoPath ?? ""),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SideBar() {
    return Card(
      elevation: 10,
      child: SizedBox(
        height: double.infinity,
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: const Text('OBS ANKARA'),
            ),
            Visibility(
              visible: StaticUser.userType == "student" ? true : false,
              child: ListTile(
                title: const Text('Notlar'),
                onTap: () {
                  setState(() {
                    currentScreen = const GradePage();
                  });
                },
              ),
            ),
            Visibility(
              visible: StaticUser.userType == "student" ? false : true,
              child: ListTile(
                title: const Text('Ders Ekle'),
                onTap: () {
                  setState(() {
                    currentScreen = const AddLessonPage();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Öğretim Üyeleri'),
              onTap: () {
                setState(() {
                  currentScreen = const LecturerPage();
                });
              },
            ),
            ListTile(
              title: const Text('Ders Programı'),
              onTap: () {
                setState(() {
                  currentScreen = const CalendarPage();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget SideBarScreen() {
    return currentScreen;
  }
}
