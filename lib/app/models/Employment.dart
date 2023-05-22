class Employment {
  Employment({
      this.title, 
      this.keySkill,});

  Employment.fromJson(dynamic json) {
    title = json['title'];
    keySkill = json['key_skill'];
  }
  String? title;
  String? keySkill;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['key_skill'] = keySkill;
    return map;
  }

}