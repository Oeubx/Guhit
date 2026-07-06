import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _dateTimeScanOfUser = prefs.containsKey('ff_dateTimeScanOfUser')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_dateTimeScanOfUser')!)
          : _dateTimeScanOfUser;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// takes
  /// auth user id
  /// and
  /// other user id
  List<String> _conversationCreation = [];
  List<String> get conversationCreation => _conversationCreation;
  set conversationCreation(List<String> value) {
    _conversationCreation = value;
  }

  void addToConversationCreation(String value) {
    conversationCreation.add(value);
  }

  void removeFromConversationCreation(String value) {
    conversationCreation.remove(value);
  }

  void removeAtIndexFromConversationCreation(int index) {
    conversationCreation.removeAt(index);
  }

  void updateConversationCreationAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    conversationCreation[index] = updateFn(_conversationCreation[index]);
  }

  void insertAtIndexInConversationCreation(int index, String value) {
    conversationCreation.insert(index, value);
  }

  List<String> _getListANDinsertUser = [];
  List<String> get getListANDinsertUser => _getListANDinsertUser;
  set getListANDinsertUser(List<String> value) {
    _getListANDinsertUser = value;
  }

  void addToGetListANDinsertUser(String value) {
    getListANDinsertUser.add(value);
  }

  void removeFromGetListANDinsertUser(String value) {
    getListANDinsertUser.remove(value);
  }

  void removeAtIndexFromGetListANDinsertUser(int index) {
    getListANDinsertUser.removeAt(index);
  }

  void updateGetListANDinsertUserAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    getListANDinsertUser[index] = updateFn(_getListANDinsertUser[index]);
  }

  void insertAtIndexInGetListANDinsertUser(int index, String value) {
    getListANDinsertUser.insert(index, value);
  }

  /// get list then remove USER ID
  List<String> _getListANDremoveUser = [];
  List<String> get getListANDremoveUser => _getListANDremoveUser;
  set getListANDremoveUser(List<String> value) {
    _getListANDremoveUser = value;
  }

  void addToGetListANDremoveUser(String value) {
    getListANDremoveUser.add(value);
  }

  void removeFromGetListANDremoveUser(String value) {
    getListANDremoveUser.remove(value);
  }

  void removeAtIndexFromGetListANDremoveUser(int index) {
    getListANDremoveUser.removeAt(index);
  }

  void updateGetListANDremoveUserAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    getListANDremoveUser[index] = updateFn(_getListANDremoveUser[index]);
  }

  void insertAtIndexInGetListANDremoveUser(int index, String value) {
    getListANDremoveUser.insert(index, value);
  }

  DateTime? _dateTimeScanOfUser;
  DateTime? get dateTimeScanOfUser => _dateTimeScanOfUser;
  set dateTimeScanOfUser(DateTime? value) {
    _dateTimeScanOfUser = value;
    value != null
        ? prefs.setInt('ff_dateTimeScanOfUser', value.millisecondsSinceEpoch)
        : prefs.remove('ff_dateTimeScanOfUser');
  }

  List<String> _getPostTags = [];
  List<String> get getPostTags => _getPostTags;
  set getPostTags(List<String> value) {
    _getPostTags = value;
  }

  void addToGetPostTags(String value) {
    getPostTags.add(value);
  }

  void removeFromGetPostTags(String value) {
    getPostTags.remove(value);
  }

  void removeAtIndexFromGetPostTags(int index) {
    getPostTags.removeAt(index);
  }

  void updateGetPostTagsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    getPostTags[index] = updateFn(_getPostTags[index]);
  }

  void insertAtIndexInGetPostTags(int index, String value) {
    getPostTags.insert(index, value);
  }

  List<String> _userTags = [];
  List<String> get userTags => _userTags;
  set userTags(List<String> value) {
    _userTags = value;
  }

  void addToUserTags(String value) {
    userTags.add(value);
  }

  void removeFromUserTags(String value) {
    userTags.remove(value);
  }

  void removeAtIndexFromUserTags(int index) {
    userTags.removeAt(index);
  }

  void updateUserTagsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userTags[index] = updateFn(_userTags[index]);
  }

  void insertAtIndexInUserTags(int index, String value) {
    userTags.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
