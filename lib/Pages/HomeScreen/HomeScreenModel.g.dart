// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$collectionOfNamesAtom =
      Atom(name: '_HomeScreenModelBase.collectionOfNames', context: context);

  @override
  List<String> get collectionOfNames {
    _$collectionOfNamesAtom.reportRead();
    return super.collectionOfNames;
  }

  @override
  set collectionOfNames(List<String> value) {
    _$collectionOfNamesAtom.reportWrite(value, super.collectionOfNames, () {
      super.collectionOfNames = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  dynamic setDataToCollectionOfNames({required List<String> names}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setDataToCollectionOfNames');
    try {
      return super.setDataToCollectionOfNames(names: names);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
collectionOfNames: ${collectionOfNames}
    ''';
  }
}
