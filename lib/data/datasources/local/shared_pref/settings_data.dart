import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSourcePref {
  static const String _kFirstRunKey = 'firstRun';
  static const String _kUsernameKey = 'userName';

  static const String _kUserPinKey = 'userPin';
  static const String _kCurrencyKey = 'currency';
  static const String _kLanguageKey = 'language';
  static const String _kThemeKey = 'theme';
  static const String _kSecurityKey = 'security';
  static const String _kNotificationKey = 'notification';

  ///! is first runned
  Future<bool> isFirstRun() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_kFirstRunKey) ?? true;
  }

  ///! set first runned
  Future<bool> firstRunTrue() async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_kFirstRunKey, false);
  }

  ///! reset first run
  Future<void> resetRun() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_kFirstRunKey, true);
    await pref.setString(_kUserPinKey, '');
  }

  ///! setup pin
  Future<bool> setupUsername(String pin) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(_kUsernameKey, pin);
  }

  ///! get pin
  Future<String> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final pin = pref.getString(_kUsernameKey);
    return pin ?? '';
  }

  ///! get currency
  Future<String> getCurrency() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_kCurrencyKey) ?? '৳';
  }

  ///! set currency
  Future<bool> setCurrency(String currency) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(_kCurrencyKey, currency);
  }

  ///! get language
  Future<String> getLanguage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_kLanguageKey) ?? 'English';
  }

  ///! set language
  Future<bool> setLanguage(String language) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(_kLanguageKey, language);
  }

  ///! get theme
  Future<String> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_kThemeKey) ?? 'Light';
  }

  ///! set theme
  Future<bool> setTheme(String theme) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(_kThemeKey, theme);
  }

  ///! get security
  Future<List<String>> getSecurity() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(_kSecurityKey) ?? ['Pin'];
  }

  ///! set security
  Future<bool> setSecurity(List<String> security) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList(_kSecurityKey, security);
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
    return pref.getInt(_kNotificationKey) ?? 0;
  }

  ///! set notification
  Future<bool> setNotification(int notification) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setInt(_kNotificationKey, notification);
  }
}
