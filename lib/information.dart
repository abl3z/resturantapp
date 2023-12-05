class User {
  static Map<String, String> _userInfo = {
    'fullName': '',
    'email': '',
    'phoneNumber': '',
    'gender': 'male',
  };

  static Map<String, String> _pass = {
    'password': '',
    'confPass': '',
  };

  static String getFullName() {
    return _userInfo['fullName']!;
  }

  static void setFullName(String fullName) {
    _userInfo['fullName'] = fullName;
  }

  static String getGender() {
    return _userInfo['gender']!;
  }

  static void setGender(int gender) {
    if (gender == 1) {
      _userInfo['gender'] = "female";
    } else {
      _userInfo['gender'] = "male";
    }
  }

  static String getEmail() {
    return _userInfo['email']!;
  }

  static void setEmail(String email) {
    _userInfo['email'] = email;
  }

  static String getPhoneNumber() {
    return _userInfo['phoneNumber']!;
  }

  static void setPhoneNumber(String phoneNumber) {
    _userInfo['phoneNumber'] = phoneNumber;
  }

  static String getPassword() {
    return _pass['password']!;
  }

  static void setPassword(String password) {
    _pass['password'] = password;
  }

  static String getConfPass() {
    return _pass['confPass']!;
  }

  static void setConfPass(String confPass) {
    _pass['confPass'] = confPass;
  }

  static void clearUserInfo() {
    _userInfo['fullName'] = '';
    _userInfo['email'] = '';
    _userInfo['phoneNumber'] = '';
    _userInfo['gender'] = 'male';
  }

  static void clearpass() {
    _pass['password'] = '';
    _pass['confPass'] = '';
  }

  static void logout() {
    User.clearUserInfo();
    User.clearpass();
  }

  int checkGender(String gender) {
    if (gender == 'male') {
      return 0;
    }
    return 1;
  }
}
