class User {
  int? id;
  String? name;
  String? contactNumber;
  String? description;
  String? emailAddress;


  userMap() {
    var mapping = <String, dynamic>{};
    mapping ['id'] = id;
    mapping ['name'] = name !;
    mapping ['contactNumber'] = contactNumber!;
    mapping ['description'] = description!;
    mapping ['emailAddress'] = emailAddress!;
    return mapping;
  }
}