// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutosStruct extends BaseStruct {
  ProdutosStruct({
    String? nome,
    bool? comprado,
  })  : _nome = nome,
        _comprado = comprado;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "comprado" field.
  bool? _comprado;
  bool get comprado => _comprado ?? false;
  set comprado(bool? val) => _comprado = val;
  bool hasComprado() => _comprado != null;

  static ProdutosStruct fromMap(Map<String, dynamic> data) => ProdutosStruct(
        nome: data['nome'] as String?,
        comprado: data['comprado'] as bool?,
      );

  static ProdutosStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProdutosStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'comprado': _comprado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'comprado': serializeParam(
          _comprado,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProdutosStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutosStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        comprado: deserializeParam(
          data['comprado'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProdutosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutosStruct &&
        nome == other.nome &&
        comprado == other.comprado;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, comprado]);
}

ProdutosStruct createProdutosStruct({
  String? nome,
  bool? comprado,
}) =>
    ProdutosStruct(
      nome: nome,
      comprado: comprado,
    );
