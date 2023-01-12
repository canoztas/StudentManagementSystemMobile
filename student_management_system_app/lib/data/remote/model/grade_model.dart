// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

part 'grade_model.g.dart';

class GradeModel extends Equatable {
  Grade? grade;
  Lecturer? lecturer;
  Lecturer? student;

  GradeModel({this.grade, this.lecturer, this.student});

  GradeModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    lecturer = json['lecturer'] != null ? Lecturer.fromJson(json['lecturer']) : null;
    student = json['student'] != null ? Lecturer.fromJson(json['student']) : null;
  }

  @override
  List<Object?> get props => [grade, lecturer, student];
}

class Grade extends Equatable {
  int? gradeId;
  String? lessonName;
  int? lecturerId;
  int? studentId;
  int? score;
  String? lessonDate;

  Grade({this.gradeId, this.lessonName, this.lecturerId, this.studentId, this.score, this.lessonDate});

  Grade.fromJson(Map<String, dynamic> json) {
    gradeId = json['gradeId'];
    lessonName = json['lessonName'];
    lecturerId = json['lecturerId'];
    studentId = json['studentId'];
    score = json['score'];
    lessonDate = json['lessonDate'];
  }

  @override
  List<Object?> get props => [gradeId, lessonName, lecturerId, studentId, score, lessonDate];
}

class Lecturer extends Equatable {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? passwordHash;
  String? photoPath;
  String? userType;

  Lecturer({this.userId, this.firstName, this.lastName, this.email, this.passwordHash, this.photoPath, this.userType});

  Lecturer.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    photoPath = json['photoPath'];
    userType = json['userType'];
  }

  @override
  List<Object?> get props => [userId, firstName, lastName, email, passwordHash, photoPath, userType];
}
