class Validator{
  static String? validateName({required String? name}){
    if(name == null){
      return null;
    }
    if(name.isEmpty){
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateenrollment({required String? enrollment}){
    if(enrollment == null){
      return null;
    }
    if(enrollment.isEmpty){
      return 'Enrollment no. can\'t be empty';
    }

    return null;
  }

  static String? validateContact({required String? contact}){
    if(contact == null){
      return null;
    }
    if(contact.isEmpty){
      return 'Contact Number can\'t be empty';
    }

    return null;
  }

  static String? validateFatherName({required String? fatherName}){
    if(fatherName == null){
      return null;
    }
    if(fatherName.isEmpty){
      return 'Father name can\'t be empty';
    }

    return null;
  }

  static String? validateHomeContact({required String? homeContact}){
    if(homeContact == null){
      return null;
    }
    if(homeContact.isEmpty){
      return 'Home contact can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}