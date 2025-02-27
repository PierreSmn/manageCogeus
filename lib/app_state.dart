import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _activeClientID = prefs.getInt('ff_activeClientID') ?? _activeClientID;
    });
    _safeInit(() {
      _activeBrand = prefs.getString('ff_activeBrand') ?? _activeBrand;
    });
    _safeInit(() {
      _userSelection =
          prefs.getStringList('ff_userSelection')?.map(int.parse).toList() ??
              _userSelection;
    });
    _safeInit(() {
      _listQuantitySHow =
          prefs.getInt('ff_listQuantitySHow') ?? _listQuantitySHow;
    });
    _safeInit(() {
      _activeSub = prefs.getBool('ff_activeSub') ?? _activeSub;
    });
    _safeInit(() {
      _isNp1 = prefs.getBool('ff_isNp1') ?? _isNp1;
    });
    _safeInit(() {
      _activeNp1 = prefs.getInt('ff_activeNp1') ?? _activeNp1;
    });
    _safeInit(() {
      _isBrand = prefs.getBool('ff_isBrand') ?? _isBrand;
    });
    _safeInit(() {
      _isBU = prefs.getBool('ff_isBU') ?? _isBU;
    });
    _safeInit(() {
      _isLoc = prefs.getBool('ff_isLoc') ?? _isLoc;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _activeClientID = 0;
  int get activeClientID => _activeClientID;
  set activeClientID(int value) {
    _activeClientID = value;
    prefs.setInt('ff_activeClientID', value);
  }

  bool _searchingValidateds = false;
  bool get searchingValidateds => _searchingValidateds;
  set searchingValidateds(bool value) {
    _searchingValidateds = value;
  }

  String _submitterName = '';
  String get submitterName => _submitterName;
  set submitterName(String value) {
    _submitterName = value;
  }

  String _radioIndex = '';
  String get radioIndex => _radioIndex;
  set radioIndex(String value) {
    _radioIndex = value;
  }

  String _activeBrand = '';
  String get activeBrand => _activeBrand;
  set activeBrand(String value) {
    _activeBrand = value;
    prefs.setString('ff_activeBrand', value);
  }

  List<String> _listof = [];
  List<String> get listof => _listof;
  set listof(List<String> value) {
    _listof = value;
  }

  void addToListof(String value) {
    listof.add(value);
  }

  void removeFromListof(String value) {
    listof.remove(value);
  }

  void removeAtIndexFromListof(int index) {
    listof.removeAt(index);
  }

  void updateListofAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listof[index] = updateFn(_listof[index]);
  }

  void insertAtIndexInListof(int index, String value) {
    listof.insert(index, value);
  }

  List<int> _userSelection = [];
  List<int> get userSelection => _userSelection;
  set userSelection(List<int> value) {
    _userSelection = value;
    prefs.setStringList(
        'ff_userSelection', value.map((x) => x.toString()).toList());
  }

  void addToUserSelection(int value) {
    userSelection.add(value);
    prefs.setStringList(
        'ff_userSelection', _userSelection.map((x) => x.toString()).toList());
  }

  void removeFromUserSelection(int value) {
    userSelection.remove(value);
    prefs.setStringList(
        'ff_userSelection', _userSelection.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromUserSelection(int index) {
    userSelection.removeAt(index);
    prefs.setStringList(
        'ff_userSelection', _userSelection.map((x) => x.toString()).toList());
  }

  void updateUserSelectionAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    userSelection[index] = updateFn(_userSelection[index]);
    prefs.setStringList(
        'ff_userSelection', _userSelection.map((x) => x.toString()).toList());
  }

  void insertAtIndexInUserSelection(int index, int value) {
    userSelection.insert(index, value);
    prefs.setStringList(
        'ff_userSelection', _userSelection.map((x) => x.toString()).toList());
  }

  int _choiceID = 0;
  int get choiceID => _choiceID;
  set choiceID(int value) {
    _choiceID = value;
  }

  int _integrationEdited = 0;
  int get integrationEdited => _integrationEdited;
  set integrationEdited(int value) {
    _integrationEdited = value;
  }

  bool _integrationCreated = false;
  bool get integrationCreated => _integrationCreated;
  set integrationCreated(bool value) {
    _integrationCreated = value;
  }

  int _vid1 = 0;
  int get vid1 => _vid1;
  set vid1(int value) {
    _vid1 = value;
  }

  int _vid2 = 0;
  int get vid2 => _vid2;
  set vid2(int value) {
    _vid2 = value;
  }

  int _vid3 = 0;
  int get vid3 => _vid3;
  set vid3(int value) {
    _vid3 = value;
  }

  int _vid4 = 0;
  int get vid4 => _vid4;
  set vid4(int value) {
    _vid4 = value;
  }

  int _vid5 = 0;
  int get vid5 => _vid5;
  set vid5(int value) {
    _vid5 = value;
  }

  String _customError = '';
  String get customError => _customError;
  set customError(String value) {
    _customError = value;
  }

  bool _colorChange = false;
  bool get colorChange => _colorChange;
  set colorChange(bool value) {
    _colorChange = value;
  }

  int _listQuantitySHow = 9;
  int get listQuantitySHow => _listQuantitySHow;
  set listQuantitySHow(int value) {
    _listQuantitySHow = value;
    prefs.setInt('ff_listQuantitySHow', value);
  }

  int _tagChoosen = 0;
  int get tagChoosen => _tagChoosen;
  set tagChoosen(int value) {
    _tagChoosen = value;
  }

  String _videoTitle = '';
  String get videoTitle => _videoTitle;
  set videoTitle(String value) {
    _videoTitle = value;
  }

  List<int> _tagList = [];
  List<int> get tagList => _tagList;
  set tagList(List<int> value) {
    _tagList = value;
  }

  void addToTagList(int value) {
    tagList.add(value);
  }

  void removeFromTagList(int value) {
    tagList.remove(value);
  }

  void removeAtIndexFromTagList(int index) {
    tagList.removeAt(index);
  }

  void updateTagListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    tagList[index] = updateFn(_tagList[index]);
  }

  void insertAtIndexInTagList(int index, int value) {
    tagList.insert(index, value);
  }

  String _themaEdited = '';
  String get themaEdited => _themaEdited;
  set themaEdited(String value) {
    _themaEdited = value;
  }

  bool _activeSub = false;
  bool get activeSub => _activeSub;
  set activeSub(bool value) {
    _activeSub = value;
    prefs.setBool('ff_activeSub', value);
  }

  bool _isNp1 = false;
  bool get isNp1 => _isNp1;
  set isNp1(bool value) {
    _isNp1 = value;
    prefs.setBool('ff_isNp1', value);
  }

  int _activeNp1 = 0;
  int get activeNp1 => _activeNp1;
  set activeNp1(int value) {
    _activeNp1 = value;
    prefs.setInt('ff_activeNp1', value);
  }

  bool _isBrand = false;
  bool get isBrand => _isBrand;
  set isBrand(bool value) {
    _isBrand = value;
    prefs.setBool('ff_isBrand', value);
  }

  bool _isBU = false;
  bool get isBU => _isBU;
  set isBU(bool value) {
    _isBU = value;
    prefs.setBool('ff_isBU', value);
  }

  bool _isLoc = false;
  bool get isLoc => _isLoc;
  set isLoc(bool value) {
    _isLoc = value;
    prefs.setBool('ff_isLoc', value);
  }

  String _filterNps = '';
  String get filterNps => _filterNps;
  set filterNps(String value) {
    _filterNps = value;
  }

  List<String> _filterReason = [];
  List<String> get filterReason => _filterReason;
  set filterReason(List<String> value) {
    _filterReason = value;
  }

  void addToFilterReason(String value) {
    filterReason.add(value);
  }

  void removeFromFilterReason(String value) {
    filterReason.remove(value);
  }

  void removeAtIndexFromFilterReason(int index) {
    filterReason.removeAt(index);
  }

  void updateFilterReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterReason[index] = updateFn(_filterReason[index]);
  }

  void insertAtIndexInFilterReason(int index, String value) {
    filterReason.insert(index, value);
  }

  bool _filterFeedback = false;
  bool get filterFeedback => _filterFeedback;
  set filterFeedback(bool value) {
    _filterFeedback = value;
  }

  final _userCacheManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> userCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _userCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCacheCache() => _userCacheManager.clear();
  void clearUserCacheCacheKey(String? uniqueKey) =>
      _userCacheManager.clearRequest(uniqueKey);

  final _clientQueryManager = FutureRequestManager<List<ClientsRow>>();
  Future<List<ClientsRow>> clientQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ClientsRow>> Function() requestFn,
  }) =>
      _clientQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearClientQueryCache() => _clientQueryManager.clear();
  void clearClientQueryCacheKey(String? uniqueKey) =>
      _clientQueryManager.clearRequest(uniqueKey);

  final _usersSpeTagsManager = FutureRequestManager<List<TagsRow>>();
  Future<List<TagsRow>> usersSpeTags({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TagsRow>> Function() requestFn,
  }) =>
      _usersSpeTagsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsersSpeTagsCache() => _usersSpeTagsManager.clear();
  void clearUsersSpeTagsCacheKey(String? uniqueKey) =>
      _usersSpeTagsManager.clearRequest(uniqueKey);
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
