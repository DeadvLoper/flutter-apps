import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum Category { fb, x, insta, yt, tg}

class QouteModel {
  final String author;
  final String qoute;
  final DateTime date;
  final String imagePath;
  final Category category;

  QouteModel({
    required this.qoute,
    required this.author,
    required this.date,
    required this.imagePath,
    required this.category,
  });

  String get formattedDate => formatter.format(date);

  Map<String, dynamic> toJson() => {
    'qoute': qoute,
    'imagePath': imagePath,
    'date': '$date',
    'author': author,
    'category': '$category',
  };
  factory QouteModel.fromJson(Map<String, dynamic> json) {
    return QouteModel(
      qoute: json['qoute'],
      author: json['author'],
      date: DateTime.parse(json['date']),
      imagePath: json['imagePath'],
      category: Category.values.firstWhere((cat) => cat.toString() == json['category']),
    );
  }
}
