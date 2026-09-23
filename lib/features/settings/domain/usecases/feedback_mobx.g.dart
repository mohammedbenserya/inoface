// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedbackMobx on FeedbackMobxBase, Store {
  late final _$selectedAtom =
      Atom(name: 'FeedbackMobxBase.selected', context: context);

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

  late final _$alertAtom =
      Atom(name: 'FeedbackMobxBase.alert', context: context);

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
      Atom(name: 'FeedbackMobxBase.currentIndex', context: context);

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

  late final _$topicAtom =
      Atom(name: 'FeedbackMobxBase.topic', context: context);

  @override
  String get topic {
    _$topicAtom.reportRead();
    return super.topic;
  }

  @override
  set topic(String value) {
    _$topicAtom.reportWrite(value, super.topic, () {
      super.topic = value;
    });
  }

  late final _$searchAtom =
      Atom(name: 'FeedbackMobxBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$FeedbackMobxBaseActionController =
      ActionController(name: 'FeedbackMobxBase', context: context);

  @override
  void select(double val) {
    final _$actionInfo = _$FeedbackMobxBaseActionController.startAction(
        name: 'FeedbackMobxBase.select');
    try {
      return super.select(val);
    } finally {
      _$FeedbackMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlert(bool val) {
    final _$actionInfo = _$FeedbackMobxBaseActionController.startAction(
        name: 'FeedbackMobxBase.setAlert');
    try {
      return super.setAlert(val);
    } finally {
      _$FeedbackMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$FeedbackMobxBaseActionController.startAction(
        name: 'FeedbackMobxBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$FeedbackMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTopic(String? val) {
    final _$actionInfo = _$FeedbackMobxBaseActionController.startAction(
        name: 'FeedbackMobxBase.selectTopic');
    try {
      return super.selectTopic(val);
    } finally {
      _$FeedbackMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSearch(String topic) {
    final _$actionInfo = _$FeedbackMobxBaseActionController.startAction(
        name: 'FeedbackMobxBase.selectSearch');
    try {
      return super.selectSearch(topic);
    } finally {
      _$FeedbackMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
alert: ${alert},
currentIndex: ${currentIndex},
topic: ${topic},
search: ${search}
    ''';
  }
}
