class Example{
  int id;
  String desc;

  Example({required this.id, required this.desc});

  factory Example.fromJson(Map<String, dynamic> json){
    return Example(
      id : json["id"],
      desc : json["desc"]
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'id' : (id == null)? null: id,
      'desc':desc
    };
  }

}