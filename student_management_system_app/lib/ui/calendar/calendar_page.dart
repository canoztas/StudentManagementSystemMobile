// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_management_system_app/data/remote/service/grade_service.dart';

import '../../data/remote/model/grade_model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return FutureBuilder(
      future: GradeService.service.fetchAllGrades(),
      builder: (context, snapshot) {
        var model = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 500,
            width: double.maxFinite,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 70,
                          child: Card(color: Colors.grey[600], elevation: 10, child: Center(child: Text("MONDAY"))),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: 70,
                          child: Card(color: Colors.grey[600], elevation: 10, child: Center(child: Text("TUESDAY"))),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: 70,
                          child: Card(color: Colors.grey[600], elevation: 10, child: Center(child: Text("WEDNESDAY"))),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: 70,
                          child: Card(color: Colors.grey[600], elevation: 10, child: Center(child: Text("THURSDAY"))),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: 70,
                          child: Card(color: Colors.grey[600], elevation: 10, child: Center(child: Text("FRIDAY"))),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(height: 400, child: buildLesson(model, "monday")),
                        ),
                        Expanded(
                          child: SizedBox(height: 400, child: buildLesson(model, "tuesday")),
                        ),
                        Expanded(
                          child: SizedBox(height: 400, child: buildLesson(model, "wednesday")),
                        ),
                        Expanded(
                          child: SizedBox(height: 400, child: buildLesson(model, "thursday")),
                        ),
                        Expanded(
                          child: SizedBox(height: 400, child: buildLesson(model, "friday")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildLesson(List<GradeModel>? model, String day) {
    List<GradeModel>? filteredGrades = model?.where(
      (element) {
        return element.grade?.lessonDate == day;
      },
    ).toList();

    return ListView.builder(
      itemCount: filteredGrades?.length ?? 0,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 150,
          child: Card(
            elevation: 10,
            child: Center(child: Text(filteredGrades?[index].grade?.lessonName ?? "")),
          ),
        );
      },
    );
  }
}
