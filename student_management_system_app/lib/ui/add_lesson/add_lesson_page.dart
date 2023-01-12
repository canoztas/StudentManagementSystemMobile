import 'package:flutter/material.dart';
import 'package:student_management_system_app/data/remote/service/grade_service.dart';

import '../../data/remote/model/grade_model.dart';

class AddLessonPage extends StatefulWidget {
  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return FutureBuilder(
      future: GradeService.service.fetchAllGrades(),
      builder: (context, snapshot) {
        return Stack(
          children: [
            Padding(
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
                            Text("ÖĞRENCİ İSMİ",
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
                              return buildListItem(grade ?? GradeModel());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("KAYDET"),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildListItem(GradeModel model) {
    final controller = TextEditingController();
    controller.text = model.grade?.score.toString() ?? "";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            model.grade?.lessonName ?? "",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "${model.student?.firstName} ${model.student?.lastName}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            subtitle: Text(
              "${model.student?.email}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        Expanded(
          child: TextField(controller: controller),
        ),
      ],
    );
  }
}
