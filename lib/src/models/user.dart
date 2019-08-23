class User{

   String name;
   String email;
   String password;
   int phone;

  User();

  @override
  String toString() {
    return "User(name: $name, email: $email, phone: $phone, password: $password)";
  }


}