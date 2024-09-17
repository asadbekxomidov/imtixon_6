class ExpanseModel {
  final int? id;
  final String category;
  final String dateTime;
  final String comment;
  // final String amout;

  ExpanseModel({
    this.id,
    required this.category,
    required this.comment,
    required this.dateTime,
    // required this.amout,
  });

  static ExpanseModel fromMap(Map<String, dynamic> map) {
    print('qaaaaaaaaaaaaaaaaaaaaaa');
    return ExpanseModel(
      id: map['id'],
      dateTime: map['dateTime'],
      comment: map['comment'],
      // amout: map['amout'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? 1,
      'category': category,
      'comment': comment,
      'dateTime': dateTime,
      // 'amout': amout,
    };
  }
}
