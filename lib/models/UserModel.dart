class UserModel {
  String? name ;
  String? email ;
  String? role;

  UserModel({ this.email, this.name,
    this.role});

  UserModel.fromJson(Map<String,dynamic>? json)
  {

    name=json!['name'];
    email=json!['email'];
    role=json!['role'];

  }

  Map<String,dynamic> toMap ()
  {
    return {
      'name':name,
      'email':email,
      'role':role,
    };
  }
}