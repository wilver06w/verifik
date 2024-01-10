library mobile_client_preferences;

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void initTests() {
    Map<String, Object> values = <String, Object>{};
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues(values);
  }

  final String _languageKey = 'country';
  String get language => _prefs?.getString(_languageKey) ?? 'EN';
  set language(String value) => _prefs?.setString(_languageKey, value);

  //TODO: Revisar para remover
  final String _orderByKey = 'product.filter.product.order_by';
  String get orderBy => _prefs?.getString(_orderByKey) ?? '';
  set orderBy(String value) => _prefs?.setString(_orderByKey, value);

  final String _searchByKey = 'product.filter.product.search_by';
  String get searchBy => _prefs?.getString(_searchByKey) ?? '';
  set searchBy(String value) => _prefs?.setString(_searchByKey, value);

  final String _rangeByKey = 'product.filter.product.range_by';
  String get rangeBy => _prefs?.getString(_rangeByKey) ?? '';
  set rangeBy(String value) => _prefs?.setString(_rangeByKey, value);

  final String _genderPollKey = 'genderPoll';
  String get genderPoll => _prefs?.getString(_genderPollKey) ?? '';
  set genderPoll(String value) => _prefs?.setString(_genderPollKey, value);

  final String _antiquityPollKey = 'antiquityPoll';
  String get antiquityPoll => _prefs?.getString(_antiquityPollKey) ?? '';
  set antiquityPoll(String value) =>
      _prefs?.setString(_antiquityPollKey, value);

  final String _birthdayPollKey = 'birthdayPoll';
  String get birthdayPoll => _prefs?.getString(_birthdayPollKey) ?? '';
  set birthdayPoll(String value) => _prefs?.setString(_birthdayPollKey, value);

  final String _orderCountKey = 'orderCount';
  int get orderCount => _prefs?.getInt(_orderCountKey) ?? 0;
  set orderCount(int value) => _prefs?.setInt(_orderCountKey, value);

  final String _acceptDingKey = 'accept_ding';
  bool get acceptDing => _prefs?.getBool(_acceptDingKey) ?? false;
  set acceptDing(bool value) => _prefs?.setBool(_acceptDingKey, value);

  final String _acceptSoatKey = 'accept_soat';
  bool get acceptSoat => _prefs?.getBool(_acceptSoatKey) ?? false;
  set acceptSoat(bool value) => _prefs?.setBool(_acceptSoatKey, value);

  final String _hideMapHelpKey = 'hide_map_help';
  bool get hideMapHelp => _prefs?.getBool(_hideMapHelpKey) ?? false;
  set hideMapHelp(bool value) => _prefs?.setBool(_hideMapHelpKey, value);

  final String _isHelpFirstKey = 'is_help_first';
  bool get isHelpFirst => _prefs?.getBool(_isHelpFirstKey) ?? true;
  set isHelpFirst(bool value) => _prefs?.setBool(_isHelpFirstKey, value);

  final String _packageDeliveredKey = 'package_delivered';
  List<String> get packagesDelivered =>
      _prefs?.getStringList(_packageDeliveredKey) ?? [];
  set packagesDelivered(List<String> value) =>
      _prefs?.setStringList(_packageDeliveredKey, value);

  final String _tokenKey = 'token';
  String get token => _prefs?.getString(_tokenKey) ?? '';
  set token(String value) => _prefs?.setString(_tokenKey, value);

  final String _isLoggedKey = 'is_logged';
  bool get isLogged => _prefs?.getBool(_isLoggedKey) ?? false;
  set isLogged(bool value) => _prefs?.setBool(_isLoggedKey, value);

  final String _showBancolombiaTokenizedOnboardingKey =
      'show_bancolombia_tokenized_onboarding';
  bool get showBancolombiaTokenizedOnboarding =>
      _prefs?.getBool(_showBancolombiaTokenizedOnboardingKey) ?? true;
  set showBancolombiaTokenizedOnboarding(bool value) =>
      _prefs?.setBool(_showBancolombiaTokenizedOnboardingKey, value);

  final String _showWarehouseOnBoardingKey = 'show_warehouse_onboarding';
  bool get showWarehouseOnboarding =>
      _prefs?.getBool(_showWarehouseOnBoardingKey) ?? true;
  set showWarehouseOnboarding(bool value) =>
      _prefs?.setBool(_showWarehouseOnBoardingKey, value);

  final String _showXigoPagosOnboardingKey = 'show_Xigo_pagos_onboarding';
  bool get showXigoPagosOnboarding =>
      _prefs?.getBool(_showXigoPagosOnboardingKey) ?? true;
  set showXigoPagosOnboarding(bool value) =>
      _prefs?.setBool(_showXigoPagosOnboardingKey, value);

  final String _showXigoPointsAlertKey = 'show_Xigo_points_alert';
  bool get showXigoPointsAlert =>
      _prefs?.getBool(_showXigoPointsAlertKey) ?? true;
  set showXigoPointsAlert(bool value) =>
      _prefs?.setBool(_showXigoPointsAlertKey, value);

  Future<void> reload() async {
    await _prefs?.reload();
  }
}
