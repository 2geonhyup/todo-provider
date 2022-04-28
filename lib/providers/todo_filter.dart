import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_provider/models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({
    required this.filter,
  });

  // factory constructor를 이용해 만들면 initial state가 뭐였는지 개발 후 한참이 지나도 알 수 있음
  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  bool get stringify => true;

  // 값이 들어오면 변경해서 반환, 들어오지 않았다면 기존(기본)값 반환
  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

class TodoFilter with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  // copy with 활용, filter 변경한 새로운 state 객체 받아옴
  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }
}
