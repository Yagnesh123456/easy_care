class BannerMessages {
  final String? type;
  final String? title;
  final String? text;


  BannerMessages(
      {this.type,
      this.title,
      this.text});

  factory BannerMessages.fromJson(Map<String, dynamic> json) {
    print("json: "+json.toString());
    return BannerMessages(
      type: json['type'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
    );
  }

}
