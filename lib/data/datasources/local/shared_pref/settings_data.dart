import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSourcePref {
  ///! is first runned
  Future<bool> isFirstRun() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('firstRun') ?? true;
  }

  ///! set first runned
  Future<bool> firstRunTrue() async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool('firstRun', false);
  }

  ///! setup pin
  Future<bool> setupPin(String pin) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString('userPin', pin);
  }

  ///! get pin
  Future<String> getPin() async {
    final pref = await SharedPreferences.getInstance();
    final pin = pref.getString('userPin');
    return pin ?? '';
  }

  ///! get currency
  Future<String> getCurrency() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('currency') ?? '৳';
  }

  ///! set currency
  Future<bool> setCurrency(String currency) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString('currency', currency);
  }

  ///! get language
  Future<String> getLanguage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('language') ?? 'English';
  }

  ///! set language
  Future<bool> setLanguage(String language) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString('language', language);
  }

  ///! get theme
  Future<String> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('theme') ?? 'Light';
  }

  ///! set theme
  Future<bool> setTheme(String theme) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString('theme', theme);
  }

  ///! get security
  Future<List<String>> getSecurity() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList('security') ?? ['Pin'];
  }

  ///! set security
  Future<bool> setSecurity(List<String> security) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList('security', security);
  }

  /*
   The notification has 3 values:
    0: No notification
    1: Expense Alert
    3: Budget Alert
    7: Tips&Articles
    
    The notification is a binary number. So, if we want to set Expense Alert and Budget Alert, we will set the notification to 1+2 = 3.
  */
  ///! get notification
  Future<int> getNotification() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt('notification') ?? 0;
  }

  ///! set notification
  Future<bool> setNotification(int notification) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt('notification', notification);
  }
}
