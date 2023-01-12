// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_management_system_app/data/remote/service/grade_service.dart';

import '../../data/remote/model/grade_model.dart';

class GradePage extends StatefulWidget {
  const GradePage({super.key});

  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return FutureBuilder(
      future: GradeService.service.fetchAllGrades(),
      builder: (context, snapshot) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("DERS İSMİ",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                        Text("ALINAN NOT",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var grade = snapshot.data?[index];
                          print(grade.toString());
                          return buildListItem(grade ?? GradeModel());
                        },
                      ),
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

  Widget buildListItem(GradeModel model) {
    return ListTile(
      trailing: Text(model.grade?.score.toString() ?? "", style: Theme.of(context).textTheme.displaySmall),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.cast_for_education_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(model.grade?.lessonName ?? "", style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
