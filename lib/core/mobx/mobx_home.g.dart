// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxHome on MobxHomeBase, Store {
  late final _$selectedAtom =
      Atom(name: 'MobxHomeBase.selected', context: context);

  @override
  double get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(double value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$alertAtom = Atom(name: 'MobxHomeBase.alert', context: context);

  @override
  bool get alert {
    _$alertAtom.reportRead();
    return super.alert;
  }

  @override
  set alert(bool value) {
    _$alertAtom.reportWrite(value, super.alert, () {
      super.alert = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'MobxHomeBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$agendaAtom = Atom(name: 'MobxHomeBase.agenda', context: context);

  @override
  bool get agenda {
    _$agendaAtom.reportRead();
    return super.agenda;
  }

  @override
  set agenda(bool value) {
    _$agendaAtom.reportWrite(value, super.agenda, () {
      super.agenda = value;
    });
  }

  late final _$devoirAtom = Atom(name: 'MobxHomeBase.devoir', context: context);

  @override
  bool get devoir {
    _$devoirAtom.reportRead();
    return super.devoir;
  }

  @override
  set devoir(bool value) {
    _$devoirAtom.reportWrite(value, super.devoir, () {
      super.devoir = value;
    });
  }

  late final _$indexAtom = Atom(name: 'MobxHomeBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$photosAtom = Atom(name: 'MobxHomeBase.photos', context: context);

  @override
  ObservableList<AgendaPhotoDetailModel> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<AgendaPhotoDetailModel> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$MobxHomeBaseActionController =
      ActionController(name: 'MobxHomeBase', context: context);

  @override
  void select(double val) {
    final _$actionInfo =
        _$MobxHomeBaseActionController.startAction(name: 'MobxHomeBase.select');
    try {
      return super.select(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlert(bool val) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.setAlert');
    try {
      return super.setAlert(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int val) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.setIndex');
    try {
      return super.setIndex(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllAgendaPhotos(List<dynamic> photos) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.addAllAgendaPhotos');
    try {
      return super.addAllAgendaPhotos(photos);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
alert: ${alert},
currentIndex: ${currentIndex},
agenda: ${agenda},
devoir: ${devoir},
index: ${index},
photos: ${photos}
    ''';
  }
}
