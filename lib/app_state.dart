import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listadeprodutos = prefs
              .getStringList('ff_listadeprodutos')
              ?.map((x) {
                try {
                  return ProdutosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listadeprodutos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ProdutosStruct> _listadeprodutos = [];
  List<ProdutosStruct> get listadeprodutos => _listadeprodutos;
  set listadeprodutos(List<ProdutosStruct> _value) {
    _listadeprodutos = _value;
    prefs.setStringList(
        'ff_listadeprodutos', _value.map((x) => x.serialize()).toList());
  }

  void addToListadeprodutos(ProdutosStruct _value) {
    _listadeprodutos.add(_value);
    prefs.setStringList('ff_listadeprodutos',
        _listadeprodutos.map((x) => x.serialize()).toList());
  }

  void removeFromListadeprodutos(ProdutosStruct _value) {
    _listadeprodutos.remove(_value);
    prefs.setStringList('ff_listadeprodutos',
        _listadeprodutos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListadeprodutos(int _index) {
    _listadeprodutos.removeAt(_index);
    prefs.setStringList('ff_listadeprodutos',
        _listadeprodutos.map((x) => x.serialize()).toList());
  }

  void updateListadeprodutosAtIndex(
    int _index,
    ProdutosStruct Function(ProdutosStruct) updateFn,
  ) {
    _listadeprodutos[_index] = updateFn(_listadeprodutos[_index]);
    prefs.setStringList('ff_listadeprodutos',
        _listadeprodutos.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
