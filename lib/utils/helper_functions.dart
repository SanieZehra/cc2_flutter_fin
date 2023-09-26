class HelperFunctions{

  static String? checkEmail(String? email){
  if(email!.isEmpty){
  return "Email Address can not be empty";
  }

  return null;
  }

  static String? checkPassword(String? password){
  if(password!.isEmpty){
  return "Password can not be empty";
  }

  if(password.length < 6){
  return "Password must be of 6 character long";
  }
  return null;
  }


  }

