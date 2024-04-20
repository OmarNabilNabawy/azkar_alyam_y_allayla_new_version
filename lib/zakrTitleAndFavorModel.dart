// ignore_for_file: public_member_api_docs, sort_constructors_first
class ZakrTitleAndFavor {
  String title;
  bool isFavor;
  ZakrTitleAndFavor({
    this.title = '',
    this.isFavor = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isFavor': isFavor,
    };
  }

  factory ZakrTitleAndFavor.fromJson(Map<String, dynamic> json) {
    return ZakrTitleAndFavor(
      title: json['title'],
      isFavor: json['isFavor'],
    );
  }
}
