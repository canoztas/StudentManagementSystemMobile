import 'package:flutter/material.dart';
import 'package:student_management_system_app/data/remote/service/grade_service.dart';

import '../../data/remote/model/grade_model.dart';

class LecturerPage extends StatefulWidget {
  const LecturerPage({super.key});

  @override
  State<LecturerPage> createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage> {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("İSİM SOYİSİM",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                        Text("ÖĞRETİM ÜYESİ",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
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
        );
      },
    );
  }

  Widget buildListItem(GradeModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: 300,
          child: Text(
            model.grade?.lessonName ?? "",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 100,
          width: 300,
          child: ListTile(
            title: Text(
              "İsim: ${model.lecturer?.firstName} ${model.lecturer?.lastName}",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 20),
            ),
            subtitle: Text(
              "Mail: ${model.lecturer?.email}",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
